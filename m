Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691115;
	b=XOa6nt6UeuyAWLpKJjB21wlBpUe+UyoI4PUOpRQxtE9gtjJZgSlATaCv1oZpffFzSewP
	 k+QrEELUKcQ0qwP4dJxKAaQQ8Nh8ukeuJUFXUki7DrAF2EnXmP5w87/kgEErm8m5UsMfJ
	 mXwgUpQpeIDa62MNif+GuwN2ZGmoG43PdI2PHfLj0X/K8XVg4BY4+W1Se3xhMAFMdSVWX
	 1OMhhfBXHGl2ACIDoH90/aXUxiPhOHG2i/DJPlklir0GE/5/uCRIgBLK0J1r2rcyjHk14
	 BxDRH1wwzCHKvtQoafpE58nPuoimT8ORx2DPT/FRR/OkdR1s+a1tpuZRb2gnnHW3FpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691115;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=HFXWiHAkj1wetLgDRhC5nOLmwHP9VaiX8muRd2DNVr0=;
	b=NHShAYLF+m9I+aJNYrLcpilgqrT6EDo7fQJHSgTT4xTJnyTX1/OuFXuUiaMDaZpAuh5i
	 4cMHiWp/wWD9Q2TBV8Vm4Iw/cbwbNhGZnuHumIH0GPudhdZIX0QSlYmHSm3xbLxmB1x8p
	 qF64ZnL0WnF176LGczj0YSTW9AV9LH8qDCWZXE7azSZz8MP7zl09pgNRGbVBA+9HUQUBP
	 f61f0PGZ/oN7kze0QUUiAEmpW8M/kWMqGYVgjJQYqcWGmzZqwdhTJJ6vdRvdwJGqBIEq3
	 fwxstZAYB+DEsxg9Nyp1Tegs2u3tfR3fFLyCERp70w4001CsiB7/Nm/wfZjUyDwz3HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=srQDhuHh;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7C606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=srQDhuHh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 757B0C2B9C7;
	Thu, 26 Nov 2026 11:05:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 181C960237;
	Thu, 26 Nov 2026 11:05:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D46E011E6B363;
	Thu, 26 Nov 2026 12:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HFXWiHAkj1wetLgDRhC5nOLmwHP9VaiX8muRd2DNVr0=;
	b=srQDhuHh3/St5JIqeUCZsPEPot46UAXyf1g0XXjWn6KPDCW2hNOcFBdSyxkkvIOLJtlGLo
	1phyIDZTF/MxOUg31RFM29QT2zQrcBw0J1X1ghIoVYzDVxXm2vuqQtpSwTxBFRCuuIwRDu
	LqTmK1pKiTxMbI2hyRcKyqRes6evzVE7eXQ7vweTt+4Y9VQ/eltvIyWcNVQenD52exccHi
	4BlxZ++n1NnnsTc+6SUo7fJofsQZjbDzUbayLBHhQdxoV8svAbyj6TJxASgw4NaimwfXNf
	kvzzyL+8Y8zjxoziWHtqGRL0l9UPZuPHNb2qLoKkuXXezNMZxswHs7I5IvLbtg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?B?7J206rG07ZiV?= <leegun25@proton.me>
Cc: alex.aring@gmail.com,  stefan@datenfreihafen.org,
  linux-wpan@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH net] mac802154: take RTNL around ASSOC RESP transmission
In-Reply-To: <-4vARCf0AvznsCw8bnUA-0HXh6HLIvZclkIK_aUJIf4ULKof8WuzgWidE8XZJi5Cndbt9iMVb_IiHNVA4W6GDQlym0Ny8mSRaxRCojci95o=@proton.me>
	(=?utf-8?B?IuydtOqxtO2YlSIncw==?= message of "Wed, 25 Nov 2026 22:35:11
 +0000")
References: <20261121150835.256812-1-leegun25@proton.me>
	<87se0qqd5l.fsf@bootlin.com>
	<-4vARCf0AvznsCw8bnUA-0HXh6HLIvZclkIK_aUJIf4ULKof8WuzgWidE8XZJi5Cndbt9iMVb_IiHNVA4W6GDQlym0Ny8mSRaxRCojci95o=@proton.me>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:05:09 +0100
Message-ID: <8733snyhsq.fsf@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

On 25/11/2026 at 22:35:11 GMT, =EC=9D=B4=EA=B1=B4=ED=98=95 <leegun25@proton=
.me> wrote:

> Hi Miqu=C3=A8l,
>
> On Wednesday, November 25th, 2026 at 03:48, Miquel Raynal <miquel.raynal@=
bootlin.com> wrote:
>
>> First let's approach the numbers. 4ms is on a locally run simulator. You
>> are fixing a subsystem that plays with radios. A physical IEEE802154
>> radio would probably bring the usual bad case to > 100ms, and worth case
>> would be above the 1s boundary. So taking the RTNL lock as you do it
>> there would no longer warn in dev mode, but might lead to a DoS.
>
> Thanks for pointing this out. I also found that taking the RTNL in
> the association response worker causes association between two PHYs
> on the same host to time out in hwsim.
>
>> Reviewing your patch makes me realize we do something even worse: up to
>> 10s waiting with the RTNL when waiting for an association response (for
>> which we are ouselves the initiator). That is slightly less a problem
>> since it is not remotely triggerable like the approach you propose, but
>> still.
>>
>> I don't remember why we *had* to take the RTNL in the mlme_tx path.
>>
>> Alex, maybe you remember why?
>
> Commit ddd9ee7cda12 added the RTNL to prevent ndo_stop() from running
> during MLME TX.
>
> I also found your 2022 device_lock proposal:
>
> https://lore.kernel.org/netdev/20220826144049.256134-11-miquel.raynal@boo=
tlin.com/
>
> I tried adding a per-PHY mutex shared by MLME TX, ndo_open() and
> ndo_stop(). With this change, the association response worker uses
> the new mutex without taking the RTNL. The existing MLME TX wrappers
> retain their RTNL requirements.
>
> In mac802154_hwsim, association between two PHYs on the same host
> works, and I saw no warnings or hangs during 5,000 association
> requests and 100 interface down/up cycles.
>
> With an artificial TX delay of 1 second, bringing the interface
> down still takes about 900 ms. ndo_stop() can still wait for an
> in-flight association response TX while holding the RTNL.
>
> As Alex pointed out in the 2022 discussion, page/channel changes
> also need to be considered. These are not covered by the new mutex.
>
> Would this be a reasonable direction for the fix? If so, I can send
> a v2.

Yes please, let's see what it would look like.

Thanks,
Miqu=C3=A8l
