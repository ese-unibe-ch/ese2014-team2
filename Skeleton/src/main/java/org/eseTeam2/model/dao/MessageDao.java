package org.eseTeam2.model.dao;

import java.util.List;

import org.eseTeam2.model.Message;
import org.eseTeam2.model.User;
import org.springframework.data.repository.CrudRepository;

public interface MessageDao extends CrudRepository<Message, Long>{
    public List<Message> findBySender(User sender);
    public List<Message> findByRecipient(User recipient);
    public List<Message> findByNotifications(User notifications);
    public List<Message> findByAppointmentInvitations(User appointmentInvitations);
    public Message findBySenderAndId(User sender, Long id);
    public Message findByRecipientAndId(User recipient, Long id);
    public Message findByNotificationsAndId(User invitations, Long id);
    public Message findByAppointmentInvitationsAndId(User appointmentInvitations,
	    Long id);
}
