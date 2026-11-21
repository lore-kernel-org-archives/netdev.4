Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288076;
	b=MYqMKVVVUcGzxA7UhH8D6/KkEKdyNlUQKOmlGfIvRyAnELsiaVPIpWxsR0cXwO05Jxse
	 oWp9kJntQPWNpcCRqEfAdKj9AIR1r9PEDDBDtfQKyquTpU/QqNPtRKe08iPODFsfxGTn5
	 /gEjh3pT+A6Y440STBMU89Tn5KlmZOZVtIJ+N+nuJOtu3qy7uT2OtNFMu89dplvHeBUsu
	 XOsgRsZhRCyTMBEAzOK7wxCwCZ3Nvd96VZXU9XyGSrTmSgdcH9F7CQRMlU+dhhyx6Dv1b
	 6SqQUQU/5z1O3V7QBaJzSrOdeS7ODXktrkT5sOEqYGmG/dzgCQ7K+XgRGj81bqinRGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288076;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Debian-User;
	bh=b08kfVCyZr2O+Mrdk0jPuzjAf5VkhdToQCa4SdwDN1s=;
	b=2lWldEE37u0Ckd5eFdSvd/oFyshkhQ8uk2ALG0d/+/xPCT5CHkIhyhc5O4mubeyJtRM1
	 W6gayvCc0CGr0k63m3YtXvZPVeGapgMQP/YZRfrxi42cR5pVJYs8PjihLBQ+uH2sCHbe+
	 23o88Cs8slEPtR8sQF+rQbnjz5aD8L56pY66Aor63lMdUUFMKaeu8smKwvUX6j8PjaLo1
	 nX5M87Wv8YtBWasdjaqeFid6lERy2IQTQdaQpstvnNl4kdV6Sd4HWl8rZZstUqNUzagVM
	 NfgAfYuqo9Ge8RLGPSTDE801q/+zCrv8YCoI2vnRhjcwzbGbWWqKCYtfu4ZIZMnVpHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=uVpsKodr;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF32606A320;
	Sat, 21 Nov 2026 19:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BF32606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=uVpsKodr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=b08kfVCyZr2O+Mrdk0jPuzjAf5VkhdToQCa4SdwDN1s=; b=uVpsKodr/9E9dl8xS2rJciStvY
	CZQE1B/FRs7nrHedZ3pFyrInAb9YGZuydRlzNXUOGJ+5zJDhEDgFVNl2cBYQPNORMpsOw7DsiGXLB
	ZGT+nFScQL+U/oeFBSy2i6IyEZ+7ojKzxVAJyVL8qSYXmbK7XQO1TVV26wKg+Msn/IVS0EznVZUKB
	V9fexNqLu1G3T/HOcx7CvLbCrpeOuaEX3uDChv3uOHRE6D9bK53eBA927JhL76WL/bfmEit0t5MOn
	Bqul8FoC0E+elnJuFEboWeLUxEy3geLK1rcclMaNchaOGFSJpXAvMpmUvdZpBUi/mjlyVIXpc5e40
	tmMPIUsQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1xUqQy-003rtM-0x;
	Sat, 21 Nov 2026 19:07:36 +0000
Message-ID: <ee0baf58-5795-424b-9a41-feb9a2e766fe@debian.org>
Date: Sat, 21 Nov 2026 20:07:34 +0100
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
Subject: Re: [PATCH net-next v2] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 olteanv@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261121092933.186731-1-bage@debian.org>
 <40db2715-55cd-46cd-a2fb-8ee11b571911@lunn.ch>
Content-Language: en-US
From: Bastian Germann <bage@debian.org>
In-Reply-To: <40db2715-55cd-46cd-a2fb-8ee11b571911@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Debian-User: bage

Hi Andrew,

On 11/21/26 18:06, Andrew Lunn wrote:
>> Parse the property in of_mdiobus_register_phy() and
>> of_mdiobus_register_device() instead, so it is handled in one place for
>> both PHYs and other MDIO devices, and drop it from
>> fwnode_mdiobus_phy_device_register().
> This seems odd. "handled in one place", yet you do it in two?
>
> Is there a reason not to do it in __of_mdiobus_parse_phys() ?

Yes. My v2 draft was exactly that (which is the reason for the commit 
message oddity) but I noticed that children with empty reg that are 
handled in the auto-scan loop would then not get the bit mask set, which 
is an unnecessary behavior change for PHYs. I will send a v3 with your 
proposal. I am happy with either of them.

Thanks,
Bastian

