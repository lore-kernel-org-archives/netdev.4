Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991770;
	b=vsQs0gn+sGkBkhX24rBk3e4NeGY++VmYMe5ErGHaMgze5KzWa9wsfUuNdHGUrNKAjwJN
	 XFOFHNuO/Ee/8Z2E21lc5LO1qoTwcscFYfVxuhJDvNJB+71IhM89mMa6J8/xM6MY+BW0u
	 L+ut47kqTcVxND1Poyu12kIhSmw2uOqo98YrmYtNeM4Q+YgfcY0olEECFhl+P2c4xz6QO
	 0XrTYhV7FjM4UJVH1OqARLEy2jNkQSKGLyyWhvVB+oWOd8mWgbpKsRgJQweSpwtIGJZqk
	 1s3Q8TZvpEbVNcPh36uGYKGA6FpkOb6zFjo01++vgk0pzzVvn/bboiufytFZsfvE0Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991770;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Vg0inbEtoyKbbQyJrrTaocJklCzsJETiIGEWsCh/Xn0=;
	b=aAv1IQr79/f4H0bprYa8abpvW2zeG/uM3Yxst9T8QyLk6IIbqaF4OSWtYBbxo8lzInl+
	 Fd8dl5hgENma+Jh6OejLHoTfKAMXC99VjpZkdDzIYb9gn+IZUaMTjaodBq2/dVnlSUKxZ
	 XuTYmXG+Ws5DGpZl5zP95mKY+l1YmQMQcJVC7XUadEzSN71Dvaor+n4uT1HG2tmqBQJZm
	 IW4u9J6VFi6q3ZB69iUZG2qvVnzQqKlatGMGLhim6idOxgRo+3M0aXW88FNLsRmvWZEfH
	 Qb0XaAtZOEL+57ZBmkFxH286L7RgQPW7YbcdHEQUOqVlMgwcZ15RXsBIzhzjf3cT3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=IkhOI3Ml;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFB2606A31C;
	Wed, 18 Nov 2026 08:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=IkhOI3Ml
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4602BA1631;
	Wed, 18 Nov 2026 09:49:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794991766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vg0inbEtoyKbbQyJrrTaocJklCzsJETiIGEWsCh/Xn0=;
	b=IkhOI3MlJDkA1TVHMlT62Iu0ur4tZ0tjh1scTagRN7Cx4s8fIr8VZJFRfsX4EpAkc/u6PN
	ugR4Qg6rvpju6i6hIQ15Fnj3XnOTaUEOJSMDspPATNQeJWGnpJ8XCYg8Z3PCC8eXp99M4S
	09hs+zXTQnZ2toNtJK16z3jlohdc3GxUqVntj+Kny7s55Gx/HglTJob7eveiHuX46z0vb4
	HKTAaP9rwQKFC8cQj2A2Uxwlgnss0ijfVtOSru09c2qfygrjkd77S3605K+lya6yZsGCLg
	FlB5kwAkZtdnkr/Xx+SpLyoc8cv0oICwYh+YinLq0Gt9lkiUmV5qX3ctPTXPIA==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 09:49:22 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>, Justin
 Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next v3 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
In-Reply-To: <20261117233149.1693881-5-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
 <20261117233149.1693881-5-florian.fainelli@broadcom.com>
Message-ID: <277e72ae43829333301f71adb31e3753@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 18.11.2026 00:31, Florian Fainelli wrote:
> Add Clause 45 read/write support to the UniMAC MDIO bus controller 
> driver
> by implementing the read_c45/write_c45 bus callbacks. Each access 
> performs
> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
> under
> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
> MDIO_CFG is only written when the mode actually changes.
> 
> Also skip the BMSR workaround read in unimac_mdio_reset() for children
> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
> expected to respond to C22 accesses.
> 
> Note that providing read_c45/write_c45 also makes the MDIO core scan 
> for
> C45 PHYs at registration time, on addresses that are not masked and do 
> not
> already have a C22 device.
> 
> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
