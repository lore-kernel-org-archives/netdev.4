Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673714;
	b=YfYnn9WjZ4TYoHfCviIqU6XydFdWYL/UmVJiqgk8uN0EDhj8notF0Q2AVxR3pl+4UDxO
	 4th3QO3pGAmZXFTE7HUiQRSVXn+kAKcPl8IedMO5dKNu7amI4Gg/meQ8e+XBmJ5f0Drnp
	 1MtVsU6D8ZV/DbGfB+ocmnp59BNmuiBo7tDkLs4fLJPbpdiVPGq36t4PHZ73+C1BibU8v
	 rqfLLaepe3KBYTx6/0eBmMBej0EJwHgia6oQX6rR2xcKQylWWnht1d7FX1LbquuQ8U9Mk
	 524punL7XppZiVnt/zZVDDRVe8kF3Ll/hfLYqc809YJMRfzgzaNEpQ4wr4gCl8cq9gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673714;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=jEGqV4doDh3QRJmtSMu7Rj/KdcXMLVe1rthA8EJprIE=;
	b=wgGH5MASCFm/h6WyBHfklz+7WRGjAb6nAXDBreyPWZjFkoWArIJHHzjwg2JntOJVfKYo
	 82Hqcq/JGkt6kqbuGBXnptFigJvhrWS+FjKq9sy078Xp1WQ+XbO28OdwdcOZdJnGqcSwA
	 Ni67vMn6b26Toe0pmVm0zy71yQcn20vQyeKKI0pMUbYpSWg302tYyzdVIXUC3Voz/5bAk
	 y/9vmCEfmkk/i5VmT9QvEbG3dISypC4EN7MLTYMzHi1+nHUTc7PaxJcePktytTSC1PkCx
	 TerDqvbyQRRLwEQEhhzSM+PkgC6rYdMi3HyQ6nLv6Io76BPZueDNeqQnAwFDKbY76cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=L2qDX4El;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA011606A321;
	Thu, 26 Nov 2026 06:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA011606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=L2qDX4El
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ6DtQeA4050046, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1795673636;
	bh=jEGqV4doDh3QRJmtSMu7Rj/KdcXMLVe1rthA8EJprIE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=L2qDX4El0uLTp3Dfwbi943oDRx5LvjEznzTWwJFCKkSysHcEIOoMuofd2gih/TIl/
	 6uc4ePVF9Q6zPdLJaqMa07vd7+DosPeEhihsRFnAIiapB/oNgjM78X8kznoeM6CHU4
	 tYJ7VvdEo7EqrdCXhVQiD3Mt7a1xmN8hjnp0Qyz89JxzKfxIZgCAnHKhY7L1O/zB2x
	 QFflivdjpl8fxr7xS4Vrc8ld1cFQV4av2rUWGeY3lI0AlDS6AZ4lphaWfKnyAZay3h
	 Qv94v3Sh4mett0vjvCZ/of6WBfkjNoiNz8eEIId5H9yiZkD9Nd9lMU8R79OEx2Jok1
	 owW3mppbOfiLQ==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ6DtQeA4050046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 14:13:56 +0800
Received: from RS-EX-MBS3.realsil.com.cn (172.29.17.103) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 14:13:55 +0800
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103]) by
 RS-EX-MBS3.realsil.com.cn ([172.29.17.103]) with mapi id 15.02.2562.056; Thu,
 26 Nov 2026 14:13:55 +0800
From: Javen <javen_xu@realsil.com.cn>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "nb@tipi-net.de" <nb@tipi-net.de>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
Subject: RE: [PATCH net-next v4 3/3] net: phy: realtek: add hardware
 timestamping for RTL8127a
Thread-Topic: [PATCH net-next v4 3/3] net: phy: realtek: add hardware
 timestamping for RTL8127a
Thread-Index: AQHdfLusREI69QMHwUie9alKwtUlK7c+iZ7RgAFTcXA=
Date: Thu, 26 Nov 2026 06:13:55 +0000
Message-ID: <15f473435a41440da45c6d070edc1128@realsil.com.cn>
References: <20261125090217.1198-1-javen_xu@realsil.com.cn>
 <20261125090217.1198-1-javen_xu@realsil.com.cn>
 <20261125090217.1198-4-javen_xu@realsil.com.cn>
 <20261125090217.1198-4-javen_xu@realsil.com.cn>
 <awathfkR13ZQH6g9@lxl00025.wbi.nxp.com>
In-Reply-To: <awathfkR13ZQH6g9@lxl00025.wbi.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

>
>
>On Wed, Nov 25, 2026 at 05:02:16PM +0800, javen wrote:
>> +     phydev->default_timestamp =3D true;
>
>Enabling new instances of phydev->default_timestamp is not an option that
>you have. Did you research why it exists?

Hi Vladimir,

Thanks for review. I understand that phydev->default_timestamp was introduc=
ed to preserve legacy behavior. However, RTL8127A doesn't support mac ptp. =
The PHY is the only hardware timestamping block available on this link. Wit=
hout setting default_timestamp =3D true, the current core framework simply =
breaks for this PHY-only chip.
How would you prefer handling such hardware without mac ptp? Any suggestion=
 would be great helpful.

Thanks,
Javen
