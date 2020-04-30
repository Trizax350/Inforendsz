package hu.iit.hajnal.view;

import hu.iit.hajnal.model.ClientsEntity;
import hu.iit.hajnal.model.MoviesEntity;
import hu.iit.hajnal.model.RentingByClient;
import hu.iit.hajnal.service.ClientServices;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

@ManagedBean(name="clientView")
@SessionScoped
public class ClientView implements Serializable {

    private ArrayList<ClientsEntity> clients;

    private ClientsEntity selectedClient;
    private ArrayList<RentingByClient> selectedClientRentings;

    private ClientsEntity editedClient;
    private ClientsEntity newClient = new ClientsEntity();
    private boolean edit = false;

    @ManagedProperty("#{clientsServices}")
    private ClientServices services;

    public ArrayList<ClientsEntity> getClients(){
        clients = services.getClients();
        return clients;
    }

    public String addClient(){
        services.addClient(newClient);
        newClient = new ClientsEntity();
        return "clients?faces-redirect=true\"";
    }

    public String deleteClient(ClientsEntity client){
        System.out.println(client.toString());
        services.deleteClient(client);
        return "clients?faces-redirect=true";
    }

    //To clients Editing
    public String changeEdit(){
        edit = !edit;
        editedClient = selectedClient;
        return "client_data?faces-redirect=true";
    }

    public String saveClient(){
        System.out.println("Clients mentése: " + editedClient);
        services.editClient(editedClient);
        changeEdit();
        return "client_data?faces-redirect=true";
    }

    // To show client data + rented movies
    public String dataClient(ClientsEntity client){
        System.out.println("Selected clients: " + client.toString());
        selectedClient = client;
        getRentingByClientID();
        return "client_data?faces-redirect=true";
    }

    public ArrayList<RentingByClient> getRentingByClientID(){
        selectedClientRentings = services.getRentingByClient(selectedClient);
        return selectedClientRentings;
    }
    //-------------------//

    public void setDataClient(ClientsEntity client){
        selectedClient = client;
    }

    //To Save Renting to database and get selected client renting.
    public String saveRenting(MoviesEntity moviesEntity){
        services.saveRetings(moviesEntity,selectedClient);
        getRentingByClientID();
        return "client_data?faces-redirect=true";
    }

    //To delete renting from database and remove renting from selectedClientRenting list.
    public String deleteRenting(RentingByClient renting){
        services.deleteRenting(renting);
        selectedClientRentings.remove(renting);
        return "client_data?faces-redirect=true";

    }

    //To get days from end
    public int getDaysFromEnd(Date date){
        return (int) services.getDaysFromEnding(date);
    }

    //Getters and Setters

    public void setClients(ArrayList<ClientsEntity> clients) {
        this.clients = clients;
    }

    public void setServices(ClientServices services){
        this.services = services;
    }

    public ClientServices getServices() {
        return services;
    }

    public void setSelectedClient(ClientsEntity selectedClient) {
        this.selectedClient = selectedClient;
    }

    public ClientsEntity getSelectedClient() {
        return selectedClient;
    }

    public ClientsEntity getNewClient() {
        return newClient;
    }

    public void setNewClient(ClientsEntity newClient) {
        this.newClient = newClient;
    }

    public ClientsEntity getEditedClient() {
        return editedClient;
    }

    public void setEditedClient(ClientsEntity editedClient) {
        this.editedClient = editedClient;
    }


    public ArrayList<RentingByClient> getSelectedClientRentings() {
        return selectedClientRentings;
    }

    public void setSelectedClientRentings(ArrayList<RentingByClient> selectedClientRentings) {
        this.selectedClientRentings = selectedClientRentings;
    }

    public boolean isEdit() {
        return edit;
    }

    public void setEdit(boolean edit) {
        this.edit = edit;
    }
}
