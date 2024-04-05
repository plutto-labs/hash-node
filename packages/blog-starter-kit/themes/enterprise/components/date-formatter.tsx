import { format, parseISO } from 'date-fns';
import { es } from 'date-fns/locale';

type Props = {
	dateString: string;
};

export const DateFormatter = ({ dateString }: Props) => {
	if (!dateString) return <></>;
	const date = parseISO(dateString);

	const formattedDate = format(date, 'LLL d, yyyy', { locale: es });
  	const formattedDateWithUpperCase = formattedDate.charAt(0).toUpperCase() + formattedDate.slice(1);

	return (
		<>
			<time dateTime={dateString}>{formattedDateWithUpperCase}</time>
		</>
	);
};
