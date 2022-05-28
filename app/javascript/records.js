const university = jQuery('div[data-university-url]').data('university-url');
const type = jQuery('div[data-type]').data('type');
const id = jQuery('div[data-id]').data('id');
const pairDate = jQuery('div[data-pair-date]').data('pair-date');
const html = '<div class="px-3 py-3 mx-auto text-center"><h2 class="h1-responsive font-weight-bold text-center my-5">Внутрішня помилка сервера</h2><p>Спробуйте повернутися на <a href="https://my-university.com.ua">Головну</a> сторінку, або <a href="https://my-university.com.ua/contacts">Повідомте про помилку</a></p></div>';

jQuery.ajax(`/universities/${university}/${type}/${id}/records?pair_date=${pairDate}`, {
	type: 'GET',
	dataType: 'html',
	error(jqXHR, textStatus, errorThrown) {
		jQuery('#spinner').remove();
		return jQuery('#records').html(html);
	},
	success(data, textStatus, jqXHR) {
		jQuery('#spinner').remove();
		return jQuery('#records').html(data);
	}
}
);
