Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141921;
	b=AU19u7SHwdqHhmtAeUVav7/7MDSR1dvuwiuLmk5ccCUf3tQfDIZJA3XJtu/c10BlNJeq
	 ci96zMELLm3AOeT7+vtQCCcKE3QfjKOHKK7a1GLSh8zcCpC0rk3aw/JiHKMBum/noNLKQ
	 E9jbWvx+GyU/QqKXpADVBAuXuNf97Pbnsqhy+V/HeZTCpxsCxg+dU6/aQhQWVNwawMqy5
	 odupuaY9C1ATTDOLT4XTQBgy0IY1hZxVoUMKRvNxyLdv5V1P6j5TfJzPo7BKGLhvbwdvQ
	 b2DqX7dqPsTRIFn3aCxnGmddZC6+hQbQGdW5SUrBhsxS2lzHoOtC2P3jZTGuz2d/f2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141921;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UufCme3tmYLvdJFXAZuK/b8CZAV4alHksOn01cS/JMU=;
	b=qGjSIK9N0xnvmJO8eM+zeV661owqcuQYFH3DRTseLZaZMF8ANBYWHSfRhO1NJqkpCwId
	 aQ45tdjUjP9xrFjs3nC7XJR08AWkIBHMq3UpqbzphrXqZceFrkeV0V2VZQ5qkuR+/t4GC
	 C+mqlAqZHQiC2IC1LnOOEw+RO0WcvlJf1p2YsbI2Dzov9YjE7jH9oO3shysh1skDzt1gE
	 CxCw7ayW8BsOgshIU3c8Qcew9IOVlUt/2TPV1TBFimVcgBMjpsLBu+cqiMyR6ZjBUWef8
	 aIf+zXzXUbh7fUH+SJqeDLh30fZgkm+7EbdlSGUc4uelz8b5Q4UqIhYkf/1PjpZ7qQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=ttslCrr4;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FC1606A320;
	Fri, 20 Nov 2026 02:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02FC1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=ttslCrr4
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AK2VP5I03073644, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1795141886;
	bh=UufCme3tmYLvdJFXAZuK/b8CZAV4alHksOn01cS/JMU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ttslCrr4yBuUjD9ZoYDMMSVPcYp+O4vlkeFEqMMa52mGIO4VBzZHUqHEGx85A/wdl
	 EvOulJzcCYwcSRgQt0vmPlNs/stipzxjRkICTEKTvwN8LoTlhUslU8x9R7OkyQYNwY
	 TVX4EyaUYefTUEeDLgRu4kxdLYPeZ1Pb1R8TIeRVo3d+zbicx9vaVoMBH37dLMIHq1
	 LpzUJjKgAyIT8vM6Ujf5xmMc821eEnnWLf+Z6b9sxQ30DhWPaxbIRlA0UDw/TYmRXs
	 wcm1Na5aPqGu7wvG9nUfVWpQdovD+HDSjVZ3vWAazIbcIpwB579tcAvtYQmAsFmUGf
	 NEQ6OhldL/Cng==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AK2VP5I03073644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Nov 2026 10:31:26 +0800
Received: from RS-EX-MBS3.realsil.com.cn (172.29.17.103) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 10:31:25 +0800
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103]) by
 RS-EX-MBS3.realsil.com.cn ([172.29.17.103]) with mapi id 15.02.2562.056; Fri,
 20 Nov 2026 10:31:25 +0800
From: Javen <javen_xu@realsil.com.cn>
To: Vlad Banea <montrealtango@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "nic_swsd@realtek.com"
	<nic_swsd@realtek.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [RFC net-next 0/5] r8169: RSS for the RTL8125B
Thread-Topic: [RFC net-next 0/5] r8169: RSS for the RTL8125B
Thread-Index: AQHdcig6xVAtRWWX50GIUgS7k1U2Jrc02dOAgAFu/hA=
Date: Fri, 20 Nov 2026 02:31:25 +0000
Message-ID: <d672fb6d16b04fb4a1c9b3202d276662@realsil.com.cn>
References: <20261111220114.3863505-1-montrealtango@gmail.com>
 <20261119123305.2459069-1-montrealtango@gmail.com>
In-Reply-To: <20261119123305.2459069-1-montrealtango@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Pg0KPkhpIEhlaW5lciwgSmF2ZW4sDQo+DQo+R2VudGxlIHBpbmcgb24gdGhpcyBSRkMuIEl0IHN0
aWxsIGFwcGxpZXMgdG8gbmV0LW5leHQuDQo+DQo+VGhlIHF1ZXN0aW9uIEknbSBsZWFzdCBzdXJl
IGFib3V0IGlzIHBhdGNoIDE6IGlzIHRoZSBSVEw4MTI3QSBhZmZlY3RlZCBieSB0aGUNCj5zYW1l
IFRYIGRlc2NyaXB0b3IgcmFjZT8gSWYgc28sIEknbGwgc2VuZCBwYXRjaCAxIHRvIG5ldCBhcyBh
IGZpeCBvbiBpdHMgb3duLg0KPkNvbW1lbnRzIG9uIHRoZSBvdmVyYWxsIGFwcHJvYWNoIGZvciB0
aGUgUlRMODEyNUIgd291bGQgYWxzbyBoZWxwIGJlZm9yZSBJDQo+c2VuZCBhIG5vbi1SRkMgdmVy
c2lvbi4NCj4NCg0KSGkgVmxhZCwNCg0KUlRMODEyNyBpcyBhbHNvIGFmZmVjdGVkIGJ5IHRoaXMg
aXNzdWUuDQoNClRoYW5rcywNCkphdmVuDQoNCj5UaGFua3MsDQo+VmxhZA0K
