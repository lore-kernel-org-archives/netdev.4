Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862202;
	b=IZTWCwcPBxPsaeN45EwuGSMZCQE8ebRLVj+jwlO+Bx4JPLNZ5N7i10oJhpbhTbcGJK7P
	 fqXMmXNP/VQe7NYMWXBVq+6rC43s1QRo0MzwLThOnuiSUSG8z69jpDnYi0EyCQhlu8wOY
	 7ZqZpJN9XLrKpB5KSTNmZ++/6qT1wiiUCRrmnA092DjwLB4/zWx804lLnohw4tKn/0cmn
	 x4B00uDpF1Emes+snfShW77qNNjphcAJQhZnXhzSVhIdkE2djZU81nxkFMHzYE47b+3Xq
	 uLKtysTC0Pq19xd2rhuZCjwNyediFsyRg6757FNuRH//XHRWje2i0+VLBOT2bkD2u/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-WP-MailID:
	 X-WP-AV:X-WP-SPAM;
	bh=vZ3UrWRrMzQPlpyjoGn0hYrTC6o8N4yYNOCu+Rlhosg=;
	b=pWxEsrdEhsV7pSOL7/ika5tqOA+8vT0B2fOjKHANJ6zSI5LwwE6/bXJBktA+yJTrFnfj
	 C2KTeS0riy0ec1596h5F49GIHy7jrD8gO9Is6WUcKUHqSFU/9H9X2ogHWcLinDLfNpfvp
	 fAHtKM4AXbaX0n2sKDkXq0iVvcZKdfv/HHg4EJmKcRp/FX9VYy9ME9uhifW8quT0qZPwL
	 fvJL25ceCObrM9mK+LFn4uL5qKsZYUbEiZ2ccaLZdpIVpsu5BHfRyl/41I1r6EMbRQ/lO
	 5PH4q3v7YH/bCkLgoK0iIitqJ4MkdnOHqOLHszb7hrzWdnUP1GTajKpXXT02FsyM7vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=VRgvj7Gp;
	arc=none smtp.remote-ip=212.77.101.11
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2700606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2700606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=VRgvj7Gp
Received: (wp-smtpd smtp.wp.pl 3636 invoked from network); 16 Nov 2026 21:49:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1794862192; bh=vZ3UrWRrMzQPlpyjoGn0hYrTC6o8N4yYNOCu+Rlhosg=;
          h=Subject:To:Cc:From;
          b=VRgvj7GpTKpIRaFlbtF1Z44vkVtTPxuXnvDGsSBDOAW8zISxWldRFOZazQU9wsDB2
           kLT6MpeG31rC5Xhfh5nA51vMvod1rcKpk7bMd6SoWFflVLNSX/YgrJlTghVv4QLBwD
           Gb61ui/l3oK6en/irkHyCb7YmtQ6qUznGrT2Yhq+waBUiEvxVukQ3AuR/Y6SAWgCt+
           shGK+g3ImCAo38Vw/uAQa6+XB+PJ85zkf5/k908u+BhVElzy6ymX8hv8K9g9TLAT7H
           bWpC/S6peQQ4P+m6O7urZ4FGrlBhBRn2jutgUlbJJGnzZTSJZKdn2Ik/Z0dFog/ksP
           mUg8DkHs/7fpQ==
Received: from [192.168.3.224] (83.24.146.222.ipv4.supernova.orange.pl [83.24.146.222])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <andrew@lunn.ch>; 16 Nov 2026 21:49:52 +0100
Message-ID: <8ce3fdd2-2312-4a5b-8f36-7d1414ab3f83@wp.pl>
Date: Mon, 16 Nov 2026 21:49:53 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mv88e6xxx: Enable LED control on
 88E6171
To: Andrew Lunn <andrew@lunn.ch>
Cc: olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261115181305.2860498-1-olek2@wp.pl>
 <501adfa2-70dd-4fc0-b972-eb29785116e2@lunn.ch>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <501adfa2-70dd-4fc0-b972-eb29785116e2@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: c8b52fd108579c5118e9dfeba272e791
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [wRNU]                               

Hi Andrew,

On 15/11/2026 19:54, Andrew Lunn wrote:
> On Sun, Nov 15, 2026 at 07:12:36PM +0100, Aleksander Jan Bajkowski wrote:
>> Enable LED control on the Marvell 88E6171. This switch uses a register
>> layout similar to the 6352 family, but has 4 LEDs instead of 2. Hardware
>> triggers are not supported at this moment.
> Please break this patch up.
>
> .num_leds makes a lot of sense, but please introduce it as a patch.
>
> .led_hw_triggers i'm not sure about. But please add it as a patch of
> its own.
>
>> @@ -4609,6 +4609,7 @@ static const struct mv88e6xxx_ops mv88e6171_ops = {
>>   	.port_pause_limit = mv88e6097_port_pause_limit,
>>   	.port_disable_learn_limit = mv88e6xxx_port_disable_learn_limit,
>>   	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
>> +	.port_setup_leds = mv88e6xxx_port_setup_leds,
>>   	.port_get_cmode = mv88e6352_port_get_cmode,
>>   	.port_setup_message_port = mv88e6xxx_setup_message_port,
>>   	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,
> static const struct mv88e6xxx_ops mv88e6171_ops = {
> 	/* MV88E6XXX_FAMILY_6351
>
> I assume these changes work for all members of the family?

Most likely. The ON/OFF and BLINK controls should work the
same across variious Marvell switch families. I think only
the hardware triggers differ between switch families. I can
also confirm that the 88E6341 shares the same register layout.
However, this switch has 3 LEDs. I don't have access to other
Marvell switches.

Best regards,
Aleksander

