Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214670;
	b=kHhMjDpdR+pPMGGIrOvY5JXquhGCUwXAieeGXBxInGv2vBQTyDmsdXZ2A+2tl2ogldKh
	 oJcl0Esvv6Qh5/Ok8zLF1UD3PDtG+vv/YItzqlKEKDW248G8JBJu5IwhtT3q0zj1uX+N2
	 BT+sJdMCP71gcauiel9LUvcVAtQvBbqffV5Z5VaSculLrPWYbIj34JzrUOQvEUzfhclBb
	 Ax5Z/uf71LUWMytzx7O0YlRKNtfxZ3mDn6N/c2fwzuxqaQw3hMX0zZdUF42ZZbUzzPAr1
	 Ze6PWc7qs1mjkni2wBA8Iu8a6Tfcno7I3jIWuIWBuvje3Uz5X1fsPFFMQ2yzjaP/h1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214670;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Debian-User;
	bh=InAjMD74eqipW9lRsPsCI4Ai3lEa52iW7ZUScUMh4Xs=;
	b=ta/aKaRwnpIc/we1SObKk9ZISLSsIt/70FsNI10dZ1fw60s/IlBY1PyqNjBPN9yVUbYs
	 WVb6bVKu2mfxmrQXbTlQnP2UYQks21w23nthJ/X4q4mB6s30oI+Wzf5VDy8nXH9Bp/H6W
	 /hlvUUgnjqwp/Z7JWrgBp3GGGXTtuw4aLH/lQZqDUEjtbEG5LqvKyzPGU2io7SUkOKGDH
	 hNiw29UuQThpTHU9/6QV2HPDC0sQqOsXyWXw4B9H28v+nbIPJ9g0k3RrGtnmNgi8Q+lU8
	 UScQcTJPErTAZfGLiTdk8GJVcCdyacPG3WNsScobOUOJLXtI+FbFWV+g3TCcC1WQwxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=mKKTQTOl;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288F606A68C;
	Fri, 20 Nov 2026 22:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4288F606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=mKKTQTOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=InAjMD74eqipW9lRsPsCI4Ai3lEa52iW7ZUScUMh4Xs=; b=mKKTQTOlQCONVf+xcZiJA/5+v6
	/gWpjMTXY81UM5uPzbRoFjZGlsCYwXmoX0EbgwFeHcRdVdFZ9KwDBiia/uiXqqBjVTa1T+LBRJbZa
	CY/4VcwtveScTi+pSLsJOQNG+FnfMXvcaUvhG7zPSYxXAAmliF/wke86YJQcNBz8VN+lm62EJXFSU
	3Dyh3bDojacuQ/89s26+9uoCJTNbkp2q5nlMPOX9vDqs9tqCmlcTpvBDgTt3mNYCy6NPBkoxoVJAa
	YkXqGBDCBtwPLISZH5YKsV1/kvYCAgl9ekaaTbHYINa5RIhKqLgJ8nWxLBkFgh2b8R8lXQvaEIrPb
	CdkLOk8Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1xUXL7-003CmQ-2h;
	Fri, 20 Nov 2026 22:44:18 +0000
Message-ID: <b41df4eb-855a-44eb-94a0-663945c11ac8@debian.org>
Date: Fri, 20 Nov 2026 23:44:16 +0100
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
 <3dae9a75-52cd-4999-9ed9-b51d87488511@debian.org>
 <bb2edd63-c727-4b91-869a-2b26c0d7521f@lunn.ch>
Content-Language: en-US
From: Bastian Germann <bage@debian.org>
In-Reply-To: <bb2edd63-c727-4b91-869a-2b26c0d7521f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

On 11/20/26 23:07, Andrew Lunn wrote:
> On Fri, Nov 20, 2026 at 10:40:55PM +0100, Bastian Germann wrote:
>> On 11/20/26 01:33, Andrew Lunn wrote:
>>> On Fri, Nov 20, 2026 at 12:13:19AM +0100, Bastian Germann wrote:
>>>> The "broken-turn-around" property is documented in mdio.yaml for any
>>>> MDIO device, but the MDIO core currently parses it only for PHY devices
>>>> in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
>>>> switches, are registered through of_mdiobus_register_device(), where the
>>>> property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
>>>> still treat the turn-around/read failure as an error.
>>>>
>>>> Parse the property when registering a non-PHY MDIO device and set the
>>>> corresponding bit in phy_ignore_ta_mask before registering the device.
>>> What switch is causing you problems?
>> It is with mv88e6085.
>>
>> I have just found that Nathan Rossi sent basically the same patch as
>> <20210217044443.1246392-1-nathan@nathanrossi.com>.
> [Goes and find the thread]
>
> Are you bit banging as well? Or do you have another MDIO bus
> controller?
>
> The point about the mv88e6085 using multiple addresses is valid. How
> do you have the mv88e6085 configured?

It is with the TI CPSW3G MDIO controller (ti,davinci_mdio, ti,cpsw-mdio).
As this is on a AM64x, errata i2329 applies and davinci_mdio runs with 
bitbanging.

The mv88e6085 (88E6341) is configured in multi-chip/indirect mode at 
  reg = <1>.
It does not use multiple addresses.

