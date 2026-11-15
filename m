Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757335;
	b=tM166LVbY+ZxTQ+fQ4y2/hmczEP9IoNKsSyhVblEnOVu78lmhoYIszIi4i0yOXgHqbsc
	 cfmpPfOUB/J7zBifqtVrKVgWtaiDi7j8KGc59Zmu0iPY0yTVSwUSvwhgVqDGeWmQr4Id9
	 2Mu7XCSskrHcBF74J1rvI8Aue9B8e2AKBPohysLSJARmh7DoWZvSuj17JLHAg90uormMU
	 mP5Sca1TwUwXG8L4h/FFz9YetmGiViIJ4bg8N1QwEySy0Qs3P+pPUrf5iri/KKDkaRUjX
	 gTPiWmdMrA2mAFZXTMpFBe//YGSX6vxnTLj149+f0AuC6VwVzHEGubnGZmacQQkZFFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757335;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=MbrJBmdcvX5OLSxudu7WhNNkW+2JP0bJchyleihhn/k=;
	b=Fu0nCCGSyq91tO3KNbg33XKdGwldB2lzYiH4jrnIV1OnAQXnwja/6E5+ysUNwxTz1QkX
	 2xuVKhgdEOTPUqVLpoNHGVaZrh+KO0BrxolSEqKbzWz9PLyVNh9O5NbMwoFD/z4XVxwq/
	 naUvVTwfip3JzZhVFN9PG/QAp0tlw1sUdk14wJRRISMqf277/ZVmg96sdwUy8eCJddspz
	 I38zIwwBH1GA/FXbszuk3I69H8M/1EU33bN7PKD6AIjGNftxsNYSjLg4lHB9NZBeEa1Rw
	 orAv4aPjec+aOakJnvwiF1AzYruhax7KFUSt2blYHwf5G84UCtLsTXvsN0ix6RhDOhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgZx4q+I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE12606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WgZx4q+I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4CF1F000C6;
	Sun, 15 Nov 2026 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794757335;
	bh=MbrJBmdcvX5OLSxudu7WhNNkW+2JP0bJchyleihhn/k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=WgZx4q+IC9DWIQBD2seqrKktGecAgL/GOCGOSkzD4TIQzc0wp/s/Ua0Q2KrPaxTZD
	 B7bSi0eMkin3jVsfUQEaPnU1t/heZAYxyNxPOpURWiIKZQ7kemGmEm3Xg/CPE4lUiU
	 3KexFe/KGNb8z2X9rnhWsZx8ZY0vy22nUND7n0PYC3ImzYBjfyG78+xFJ1OwFLvjIZ
	 U9rVG12JjoPms4vJuIky4teOGL3t6NhFt+iHaEY9imP1zKowdnragjE39PabIuU6+d
	 HBcz+QFuekqXcsySGf4cFRJcgRMy53FGKyx7M+2PXK36+ZnmgxbnaEXseSxnIwsBng
	 9hOl/DfQYn2XA==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 01437198003A;
	Sun, 15 Nov 2026 10:42:12 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Sun, 15 Nov 2026 10:42:13 -0500
X-ME-Sender: <xms:09L5ajDz7tY9-Usgdml6kq0493zmgMfUllpU1k5gcfifaaA3Rs8s4A>
    <xme:09L5akV_Cd4CLn7Wq5UgafH2J5mYFBgeoPmtk1xeZV42xTOeAfRoaUkK_JXC9XeMm
    KzG803dth_DQi8ej-Jgz6HVnODv2BNyiyMTJH0G_e8bPkWxoxUJk3SMzQ>
X-ME-Proxy-Cause: dmFkZTEmenXVIFofZc3ClLv6Sq/Z4JPbJ5gXxLBg3M4TxqdLK4zLcuLlCWPeYQYzbADznO
    3boPBawF75Uq+8T6vEuiuev184XSJmEvYP7y0T2ID6Mu1h4cO2VBErGpPZVzLKQ+aEEENx
    Njsn+B+0Y+SWnCUSZDBLBppq7SfiI9VKY1JUtR5etSBGE0A5PpUFuNzNn698ApLykTuYF5
    RPqetwhObmW01FtZ2tvE5kXmDntGCXI5GJynG/233IKAn0/62+9c0liRK6mJ7v74yYWYuV
    f2MQDQw6UASabHpVoKA79aMTA9sUgjv4bTSkDjNsHerPb26fiOW0TZWVWWQYa5TESpdqif
    hToGSoVMvivLdZqboLDzPQPnY6K0QWyIXGLWzkocjSzqxrvM668y8oWKwX3cL3CIgDRhd4
    qElb2uktS+UsVuYD5UUt53TSswPnnzqaK3PnPdBGBcQPzN6GL4ggXxLKJOnjFUQfAjfmt/
    UF3GYADAuDSRJBAmO1VnXRi43/2U04F7C95Rg8/saQw/e2FanfgzkvdWoo+nvBFulovwz7
    AD6AdON7JRxnl0vlJdfhF0OkKArtPqunLl5fYWCiWf+jmqSbqVjMOh50Qp1p7Av7kmQGbb
    GJpnmpNeXicqiIcU15ahilplla7iSqMadFtyPEYnG8R52xraSzxKHG844zMg
X-ME-Proxy: <xmx:1NL5alWs15tOh4-bFsnsIjUJLf6fjeldf3i3tjkZ9jyUgk-GhvW7WQ>
    <xmx:1NL5avnb7SiEbWR905s-hJMrZa0ouFtDe-ApG2TkdzPUkattGLr9TQ>
    <xmx:1NL5aoDtsgAgj_7y9xpRWdYYDWQlyGendoFBdLAoyemh6wAqQfhh5Q>
    <xmx:1NL5amgdSOCyFmXyzDJTnzxdQbvFpbFBf2g3JUD1gDDnPZU9e9IkEA>
    <xmx:1NL5atxFwxfYbTHUkfdgRz71z7q8djQEF7ZO6U3fA1tC76ptMpUfTSmu>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 196712F8005A; Sun, 15 Nov 2026 10:42:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: APqG7cBtEf9F
Date: Sun, 15 Nov 2026 16:41:41 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: "Elad Nachman" <enachman@marvell.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Oleksandr Mazur" <oleksandr.mazur@plvision.eu>
Message-Id: <5a2797d4-b3c8-43a9-a3bc-9a0928c87b39@app.fastmail.com>
In-Reply-To: 
 <BL1PPFB0715B38BF7C2E60F8CA62C66A205DB7D2@BL1PPFB0715B38B.namprd18.prod.outlook.com>
References: <20261111101521.9878-1-kaloz@kernel.org>
 <BL1PPFB0715B38BE2E57548F95CCBDFCAF7DB712@BL1PPFB0715B38B.namprd18.prod.outlook.com>
 <02e94b70-d446-4518-8f7a-c0f710e3b572@app.fastmail.com>
 <PH3PPFA2D0C836CFB7D296376875E16ECC8DB702@PH3PPFA2D0C836C.namprd18.prod.outlook.com>
 <a09fdc30-cd05-416a-8ca4-9787340fb6c3@app.fastmail.com>
 <BL1PPFB0715B38BF7C2E60F8CA62C66A205DB7D2@BL1PPFB0715B38B.namprd18.prod.outlook.com>
Subject: Re: [EXTERNAL] [PATCH net] net: marvell: prestera: disable port before
 changing its MAC mode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Elad,

On Sun, Nov 15, 2026, at 08:32, Elad Nachman wrote:

<snip>

>> Thanks. I looked at prestera_hw_port_phy_mode_get(): it only maps the
>> firmware's mdix byte to ETH_TP_MDI/MDI_X/AUTO, anything else becoming
>> ETH_TP_MDI_INVALID, and the driver never calls it for SFP ports (the
>> sfp-52 port goes through phylink and the MAC mode attribute only).
>> 
>> Two things the code cannot tell me: which mdix value does the firmware
>> report while the port is admin down (INVALID?), and does that attribute
> 
> I have managed to find the specific PHY type for TN48M.
> At least for this specific board, it will not report invalid MDI/MDI-X mode.
> 
>> carry anything for an SFP port in SGMII mode with a copper module, where
>> the PHY sits in the module?
> 
> This API only works for Marvell PHYs. If you have a Marvell PHY at the end of
> The copper module, I think it should be relevant.

Thanks for checking. Then the mdix status cannot tell me when the
port is down on TN48M, and v2 keeps the disable without a delay; the
port came up on every boot without one here. If you know a device or
firmware version where the reconfiguration fails without the delay, I
can add a bounded wait for that case.


Thanks,
Imre
