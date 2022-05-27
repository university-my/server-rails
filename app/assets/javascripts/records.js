/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
const university = $('div[data-university-url]').data('university-url');
const type = $('div[data-type]').data('type');
const id = $('div[data-id]').data('id');
const pairDate = $('div[data-pair-date]').data('pair-date');
const html = '<div class="px-3 py-3 mx-auto text-center"><h2 class="h1-responsive font-weight-bold text-center my-5">Внутрішня помилка сервера</h2><p>Спробуйте повернутися на <a href="https://my-university.com.ua">Головну</a> сторінку, або <a href="https://my-university.com.ua/contacts">Повідомте про помилку</a></p></div>';

$.ajax(`/universities/${university}/${type}/${id}/records?pair_date=${pairDate}`, {
	type: 'GET',
	dataType: 'html',
	error(jqXHR, textStatus, errorThrown) {
		$('#spinner').remove();
		return $('#records').html(html);
	},
	success(data, textStatus, jqXHR) {
		$('#spinner').remove();
		return $('#records').html(data);
	}
}
);
