Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216190;
	b=oa/F3b9pUEJcU3EhgzVE+0dPKwQBrs02BaUFXhp047Z/oK6XL7Bdak+pCC0A35RfzBsw
	 xx9FNEe1AwFWjstmd7FHPSDZXwTRtQeYQeOYRBjLibkdR8ye2Lvfd/xintUTugzyvmDn8
	 vRyo8hC0EQasTLdT5bOXj6/TZmOFfJWxYFD9fatl2wNONfzVke0u7+GldJmfTp7itN/oH
	 zukV6FCz+LWxWfLhT4CmlUD1kbrvh6r6jUAFlMy1WGh1sNpdKVI/EzwLUwHhlf5hU6CN5
	 TC6hSW4Mw2ebcRmw8oGaX0aVMH87W4t6dXLNhVZeC7AmqtknNIVGGuILj9nU8+/mlVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216190;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=OOa4MkrKn92gWVHykXzYb5CjJjtJtag6Vo9U5D+8IkA=;
	b=er06/Kt1wrKy5W3ZI9wKbemgaP/dLgIizoklUiRGVLLCxkUAwdrNjrVbfj6V9yY1TKHM
	 bj5sB2DOb5zmWoHx6N5rrKSGtnoIEIcsi5l+2TBepwNsZf64GZEbXPw1ptK4QUatUZ5qV
	 wkHrnU005GSOL/yGcIpWcrQYpzqZ3VG7dKLkzf/ALlno8/awotkAuTOksq9sfLwH5yqbJ
	 XSgglE+XuLcDIsiOUpX3vfK3YKyxHXSfW/BbJby0nHndqdlEc1z7vlqXNLZA9RMp3K1EW
	 qAbvSfug1kIpxbGPDBI0deEoOKOri2VRCtE46ClOzbNwhJgLAxuU+U8QpnyPo5/pa/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KfgkeEgB;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D636C606A6B2;
	Fri, 20 Nov 2026 23:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D636C606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KfgkeEgB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=OOa4MkrKn92gWVHykXzYb5CjJjtJtag6Vo9U5D+8IkA=; b=Kf
	gkeEgBBHORRcMYIxDWNNwkPVNW8EV+dkyZMOEGfzg2DEphlNOLWs/eIlXjv2lFDGOsOycVsyPDfg5
	GhnyCvK1+AOxXA5Tg0YUEAE1GVMhQ4jwAPA7aGbgaQhcw7SDMmu17PmfNbss1zdacceA1ZsvV/R8n
	kQ9qCjZzAePr5jA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUXjY-000O5B-KF; Sat, 21 Nov 2026 00:09:32 +0100
Date: Sat, 21 Nov 2026 00:09:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bastian Germann <bage@debian.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
Message-ID: <140da060-0de5-4f2a-8809-b05f2015c2b4@lunn.ch>
References: <20261119231319.1256419-1-bage@debian.org>
 <19d8bfb6-074e-4344-acf8-67872f7b3e48@lunn.ch>
 <3dae9a75-52cd-4999-9ed9-b51d87488511@debian.org>
 <bb2edd63-c727-4b91-869a-2b26c0d7521f@lunn.ch>
 <b41df4eb-855a-44eb-94a0-663945c11ac8@debian.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b41df4eb-855a-44eb-94a0-663945c11ac8@debian.org>

> It is with the TI CPSW3G MDIO controller (ti,davinci_mdio, ti,cpsw-mdio).
> As this is on a AM64x, errata i2329 applies and davinci_mdio runs with
> bitbanging.
> 
> The mv88e6085 (88E6341) is configured in multi-chip/indirect mode at  reg =
> <1>.
> It does not use multiple addresses.

O.K, that is good.

So the concept is sounds, it is just a question of if the parsing of
the property should be done once at a higher level, since it is
supposed to be a common property.

   Andrew
