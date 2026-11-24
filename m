Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525686;
	b=PR9dpTVuCG4CuNQ84zoiJc5YgqRVX2AOTE+1uzQ/9qJrbMkce2MhbN9peB2D5gVmz6K6
	 G1c4Y6+wxmbcMYIdLlPGeZqrlsR13w5xcX2hKshuEfAgc8v/URGS6+LzJlSu1SA3iIe2T
	 w7o/E0YIcypnh7KPZz6WaHDiQ7KXFitF27eBAEzxJQ9Qk2q3CE0Bz5QKseS9WQl7vnK7+
	 ltKDmvAvt5JyZrOM4XkDea5u5ePOuLyEIR1Oe0O0ml2zBFIgnIbZjyGmaurhNwZDyiNNa
	 Vkx51qQb4jUHk4sydKhAU/kARPrWoXa8M1GfenFpNYoCWwZC3UBzitETzcvGlllDhGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525686;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oosESyXixnnHbF5S3HtNOAGe+FND+MwLVsS8CF2PbEQ=;
	b=wXxIe8Becf2LmLRKFzNKE4auzhjuc62/pxc25Su4AtRE7s2zPe58Ulj1e2lkr+9le7w9
	 kEfhJx7jyCDf1cICSyzOfNoqP4mqB/HMAVcNAGVqsbyPR8IC2TuhAwD0tODuomp9NdNtY
	 jU6Tl0wEu2nByGQFKmXFdV9VOTDK3LDivPpFgvmVP8Ok7lr5BLm0HcrNjdubdcYx9zBkm
	 7GpqUqEbRuH+7msQuPPyil2DkidPHx9Jwu40TQdzWHnqFl4qdLrTPrhExGRZDwKd+zwKG
	 Rl/TsRtQptlFgEe2xqpJqg/pSA0DPwSDjtTn8tD+Gludojwch/fkbW/b2lqCOGJoztQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=SruTvaOe;
	arc=none smtp.remote-ip=79.135.106.96
Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202BA606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202BA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=SruTvaOe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795525683; x=1795784883;
	bh=oosESyXixnnHbF5S3HtNOAGe+FND+MwLVsS8CF2PbEQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SruTvaOeebrocGlxZ2tOtwCoU2ayhMIcI83h6HePrGbFaqdLDx/b6LBp8twcf+8tQ
	 TOIJRjHR0/lLjOTVspX/FdPWLYBJMRqMn3URc9PydAr+aqO+U6+IVksBtyqZhaZWiS
	 UNxgImkqF1r0FpBbboEkZ2YdnFA71G8zWGYkv0I22HZXbDuyfFF4TsnXYzW8KMBYcZ
	 KSDoWIH8NHloluCTOLg5cbU3RfT1T9KUl7UzVDGQl+Zu/MiAIbt9Ni2k6tXXBvt7IM
	 883s1Sr1dKMw1QsK1upR+OxmO+Gk7QlSMXb81P/QPj9hE/hXHnNKEPD9oUXoGpiL7f
	 7lIR+wTAQO+QQ==
Date: Tue, 24 Nov 2026 13:07:58 +0000
To: Linux Networking <netdev@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Configuring Sophos APX 530 Access Points APs with Sophos XGS136 firewall (also function as a Wireless LAN Controller)
Message-ID: <O2ZNaA5qh3aKRNQrbKpZQr4erGR2bXqU2jOL6AUNwDcZYwYQ8TMImWq1a_VDaZD3_GUMWKdjCm4b2i1EGPUY5xYy-Az4vk8An15qFOp7Gy0=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: ca3dafe0a8b2c800da4fb0640b268a49230b8a76
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Configuring Sophos APX 530 Access Points APs with Sophos XGS136 fi=
rewall (also function as a Wireless LAN Controller)

Good day from Singapore,

Author: Mr. Turritopsis Dohrnii Teo En Ming
Date: 24 Nov 2026 Tuesday=20
Country: Singapore

Connect DATA-1 PoE network switch to Port 5 on Sophos XGS136 firewall (spec=
ific subnet requirement 192.168.125.0/24).
Port 5 is also part of LAN zone.

Connect Sophos APX 530 access point to DATA-1 PoE network switch.

DATA-1 network switch is PoE+ capable (IEEE 802.3at).

Login to Sophos XGS136 firewall (TCP port 4444).

Go to Wireless > Access Points > Pending access points

Select the access point and click Accept

A. Enable Sophos Wireless Protection

Navigate to Wireless =E2=86=92 Wireless Settings.
1. Enable Wireless Protection.
2. Under Allowed Zones, select LAN.
3. Click Apply.
4. Under Administration =E2=86=92 Device Access, ensure the appropriate LAN=
 management and wireless services are permitted, if that option is availabl=
e in your firmware.

Sophos documents LAN as a supported zone for AP registration.

B. Create the Wi-Fi network

Go to Wireless =E2=86=92 Wireless Networks =E2=86=92 Add.

Setting |=09Recommended configuration
Name:=09Server and Printer
SSID:=09Server and Printer
Security mode:=09WPA2-Personal
Encryption:=09AES
Password:=09Strong unique password
Client traffic:=09Bridge to AP LAN
Frequency bands:=092.4 GHz and 5 GHz

Save, then go to Wireless =E2=86=92 Access Points and assign "Server and Pr=
inter" SSID to all Sophos APX 530 access points.

Do not create a separate bridge interface on the Sophos XGS136 firewall. So=
phos specifically confirms that external APX access points using Bridge to =
AP LAN do not require a firewall bridge interface.

That's all.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Republic of Singapore
24 Nov 2026 Tuesday 9.02 pm Singapore Time




