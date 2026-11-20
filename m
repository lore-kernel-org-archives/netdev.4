Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210870;
	b=w16jAVBDgPqzHFfzfDkwzFH+7dR6cEDjwWEJ520Ndozu1dMbPtrhhb1FLV+MWIW0YEHJ
	 sbZXi1pKYB8ZBIG7yHWiTSqli67U+GuEXy5zd4C700sjyNaFKuvR0mZsLU81twuT+XVDo
	 IOHF3l+4D6aKSB4pL5ODfb2zMR8mfulUx5sd4DM9TH57shIGfRs4wVZo3NBd03emHvUR2
	 iFbm4usKv4+Om+9kvmmD4uF7556nQQ4b6lgvdlw4glQrYGGhFPJGlzrztNcFdhKjG7yFZ
	 79EYN+fCZPvSgKqHYToVLoSgS313aziNfgBIl7J97YHi9bO0pgJZtBwU73KknsCFQfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210870;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Debian-User;
	bh=NZXQEsjOM4B642/ZpzASwtNwupxC2GG162cV9G+p03o=;
	b=SGGCCJdO9xDGfFW/P1QZ4KEeaHCqOFQt6Ze+gBtTe8yTM366O1oy/V70Lpo8Fn2M8oa+
	 AVt96UyOEkue2qF0lOCeYBpnEoCXQn/jsb/Ux7HhSY3WWBZqq+/1Os8ZzFgHZRpHx1sHu
	 fXJDNLbW17sLQ78khitPOxlI3ljGGzoycSUeHO2+DBviyj9QYgt51di8lRhheEONks4HF
	 YzzuzFRiGxQxOHGHCKASsgETd5g9WjDvl6qoHsRpNcr9pgF59rKfqKxxaT7X15ARBBTe+
	 joNAV3L3zZ7PLgog/Y/Tj0bE/ROdXrTKhlfm3MuXpFTZS4velw/J9ZniXul2WGQkQSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UP4CVf8Y;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DDC606A68D;
	Fri, 20 Nov 2026 21:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DDC606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UP4CVf8Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=NZXQEsjOM4B642/ZpzASwtNwupxC2GG162cV9G+p03o=; b=UP4CVf8Y6KwCNEDtivb0OtIv+u
	lRWvCcDUiCJuZR0fZuuKEsrIgNf4c1W2tBuMOS07adsoO0A7PCgSSFocC3+jzVp0nreCLd15BQS0H
	d/m5iWVJD+c7CRissT5iETIa9R54FPsu/8dCbQBvuoDG3Yfwn0p504fdR9LeXyeeXEB3wKlSPzMGD
	Ox2ULoYLSB9JJNj5rbUnXnwBMSnw4tmpUYDDREQOsI8LvkPFah5PAiO/NaKlcT/Ak8it0qKYgkASD
	7JFJiSN9mK84+yaMm37MLOxrlaW2opDddy1gbx/T94CwTS/yBXnciXO2bB0Qy5v0dahlG8yVEop5f
	kR7Gai9A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1xUWLp-003AbH-2j;
	Fri, 20 Nov 2026 21:40:58 +0000
Message-ID: <3dae9a75-52cd-4999-9ed9-b51d87488511@debian.org>
Date: Fri, 20 Nov 2026 22:40:55 +0100
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
Subject: Re: [PATCH net-next] net: mdio: handle broken-turn-around for non-PHY
 MDIO devices
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>
References: <20261119231319.1256419-1-bage@debian.org>
 <19d8bfb6-074e-4344-acf8-67872f7b3e48@lunn.ch>
Content-Language: en-US
From: Bastian Germann <bage@debian.org>
In-Reply-To: <19d8bfb6-074e-4344-acf8-67872f7b3e48@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Debian-User: bage

On 11/20/26 01:33, Andrew Lunn wrote:
> On Fri, Nov 20, 2026 at 12:13:19AM +0100, Bastian Germann wrote:
>> The "broken-turn-around" property is documented in mdio.yaml for any
>> MDIO device, but the MDIO core currently parses it only for PHY devices
>> in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
>> switches, are registered through of_mdiobus_register_device(), where the
>> property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
>> still treat the turn-around/read failure as an error.
>>
>> Parse the property when registering a non-PHY MDIO device and set the
>> corresponding bit in phy_ignore_ta_mask before registering the device.
> What switch is causing you problems?

It is with mv88e6085.

I have just found that Nathan Rossi sent basically the same patch as
<20210217044443.1246392-1-nathan@nathanrossi.com>.

> I do wounder if the call in fwnode_mdiobus_phy_device_register()
> should be hoisted up into of_mdiobus_register_device, were it would be
> common for both PHYs and MDIO devices.
>
>         Andrew
