Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990058;
	b=Di5J29ClJMjsZyDrTjRnS26V9ldmkTmQOx6yyeEdxl3MnVm5K7v23qDEToeREnhQl0sE
	 DJXivCKts8MTSeQt7ceEhpx2sBpQEearANCYodkBTQQivhIQOYEoVKTBz9jNjrV0p7+pw
	 Du1DO2IVZyoKzjCRDg7hmOJB8zrKvMtwc7VfCJ5frBl4qbZE2lCEA5vX8eWbIAfbBZb+m
	 fA9g1AAJnaXSgNeaGSe3xIJDu62PtEvidtEUpHZtde19S3VS+IaGuIL1geUlQf+ZU84sL
	 ISJcMWeFTo05Pn50W4l3IerlDl5Z9YV2NgX+RYA5A7ejRmGJjL1gKbJoe6jyM7pU3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990058;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=PxUuAs6hF9FFnuFm7OwY4l9jBpo4nI/baW8NihC/UI0=;
	b=AnsTbyDfPtKddqRZ0LqKcp1tfGUtCas+iQjAy2zbZKxZfNYOyzgDcgVPLpgseWOq2TNZ
	 oPcT4XdBMWUpegASn25AXlqsfW2AQRMsTRd7OZ/FkUDPwQB7xThT4RlPqqZDDWdmHei7L
	 8MVdHNSyTLjOOAMOW5Hrw09BRCFBJuru80aJmBSGStnbvo7gvFVZIOluv6uy8CTx5DhE1
	 2FCVZKtE7iAW1d25j42AUntlWxmq2iBKDBmVtt161lITsxqaFY8/wEPaLkNtROybc4gx8
	 CW3DxCPuQRbGnw2zn0Qteo3Gv2suyxqRjUxDoxEr4sEzRGQJ1DcJsWicFGevQ3QfmCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uXSkMD8S;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E2606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82E2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uXSkMD8S
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A1061A16A8;
	Wed, 18 Nov 2026 08:20:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 151F95FE9B;
	Wed, 18 Nov 2026 08:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B55C211BC0901;
	Wed, 18 Nov 2026 09:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794990055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PxUuAs6hF9FFnuFm7OwY4l9jBpo4nI/baW8NihC/UI0=;
	b=uXSkMD8SP7cFPwjkl1zPm3Nlck69h4eMxCwkoMwpLE9Vddbk+TRWnmVFdUjPGJOKDwHEy5
	PDBgW3YbVKb9Ex4A3Ko2apuXGcgWFdc3GV3NqzIR22lmUwGVOOf5uO/F1q41qIHwbTRjkg
	o6F5RNQMaETQus1lf5KE46i5ild8ESgVQpw14dGar1qROupVGHHvkbBLbbpbTyMUgm/2Sv
	sIfU27RyxBkkVJdamv3D6D5p2q2lHS6veGM1Z11iJ1Y3bBt8vTYxCW5HOzmLvR2qUcOCYh
	4oKJscimMKNKnM8a3iWBEMxOmf8YKfxuNwNXkkINc4aGdpPOW1FH/BSxcHJkag==
Message-ID: <560d269c-f537-47ea-8df1-b6c29d67518e@bootlin.com>
Date: Wed, 18 Nov 2026 09:20:48 +0100
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
Subject: Re: [PATCH net-next v2 4/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
To: Paul Louvel <paul.louvel@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
References: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
 <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Paul,

On 11/16/26 16:27, Paul Louvel wrote:
> The driver currently programs the mode only for SGMII-to-Copper, based
> on the PHY interface mode.
> 
> Some MACs connect to the PHY via RGMII. Add code in
> m88e1510_config_init() to configure the device.
> 
> Do not overwrite the media interface mode configured via
> m88e1510_port_configure_serdes().
> 
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

FWIW I've tested that on a SGMII-to-Copper 88e1512 PHY, and no regressions
found. I can't test on RGMII though :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

