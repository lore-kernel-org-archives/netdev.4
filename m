Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163461;
	b=w512UdUvhcR7+Neea9m3qHynRqTqvz8i6ot6RP8RpAVysMJHSVankh/JSuT5+8W+fThO
	 vxuGRIHu/v70yHuoH+gJc8ofH6q2NQ0v71TptYF4263KwVAwfnAMTqSTE5RYRImwFf4jE
	 AZU7Cv3irMFPtwI8lZkxPZ3vgdBI1Ld55s9thyDkWlBO/Mr3j8Koz+655G1s2qEcEgDLd
	 x2uDAhAW/qQAl0sBpUkCEG6sYYBa7t26u58DUabFzvlZmN0H1H++EsppaC7X8vO2vBGUv
	 fRxaMVIn2uhFqnaD0dMLZv4hFAQL+U8h/a8/0ybQJ0E9kIUvJ2p/MWs1JCGC/1C8qeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163461;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=cwJRTjbMTRT/u8iR7e37LcO8daf0ekWryQ9Qz5aGLCw=;
	b=I7tYA9FauJ7rjcCLN95bpUTpI+KWAe5bkx428raweznHSKF6HXiGmdfa4494TYXWtqwD
	 +QWlo6+zJq20qxWCio3M/whSkV0VJPkJWlpqLrkQucIdMi7qeI+w7NQBxFmV35SuP5aZ+
	 GwoDBg81oeJszuglmV3E9AFhXjM/80D/D6xyLMgUwol5WT+pw3PFXYRxbW3ONYYzcaHqG
	 BnPH4J3tM9UnXRaJgycv0/y/ZzgHrDVnYRtf6nJQpprbxhtXWlKKKOkZ4wCJo/KMKzFjP
	 IbVe6FdaCchbBfyU0WNKmc6nEclSy8C6cEP+GHtWSNM0nVa9NgPZX1jdIbLjfiGtDlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=IatFiBGd;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2D7606A325;
	Fri, 20 Nov 2026 08:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC2D7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=IatFiBGd
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51374A159E;
	Fri, 20 Nov 2026 09:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795163451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cwJRTjbMTRT/u8iR7e37LcO8daf0ekWryQ9Qz5aGLCw=;
	b=IatFiBGdelMj051XmzWwHEV20jhk7t4pKtzVrg0aIRpRcKBl3f3njRCB0qk87XZi0qJ2hp
	peWb6WC7CwXnPtcBZ9dUefdzXc9jCk1jj+3NFHuX+HQ/1e2mWiJEu05E4HMyDph0gXnGJC
	D2ZxjDgrUgALWx77Y0D7nuC8061M085YC2sBqKGJ05UD+jTCCj5Y0tCVHbC/GviEOkgPAQ
	9FFiFHECykTcRghp+MYjlzs24aIhV36mzdFGWyG98/v+iwC3wAByJvhH7aVofYScAtASVn
	vjboQx+wPYLuvu/t7Kq3Mq1qzfcTLRWcEnSURUCs7RWc5xN5upc8hzcg5fZ1gQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 09:30:47 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: Clause 45 support for
 mdio-bcm-unimac
In-Reply-To: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
References: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
Message-ID: <8a4d3925e1476061d23bc463453285e3@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Florian

On 20.11.2026 06:16, Florian Fainelli wrote:
> This patch series adds support for Clause 45 MDIO operations within the
> mdio-bcm-unimac driver. The series breaks things up in this way:
> 
> - make the C45 bus scan done by the MDIO core carry on when nothing
>   answers at an address, as the C22 scan already does
> - scope the existing defines to make it clear what is C22 vs. C45
>   specific
> - rework the polling completion loop to be a tighter loop
> - add support for clause 45 operations
> 
> Changes in v4:
> [...]

Isn't this the same you've sent already? v5 would be the follow-up?

Cheers,
Nicolai
