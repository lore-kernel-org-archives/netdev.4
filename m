Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645326;
	b=cX29v0KR8MvJlToqznhMV8HWM8ejW6ffo4+whWgrvkclWL+sO+LrVPpZ31VTke46Eepe
	 l2GxpOR6dWB9a0LMA/BUfTndGPXG2Ze+hpAqs3Bx3zxjMFkPcJnxbKTmhc61S7H5hKqZk
	 NaX/noDRBp51d1GMvmEekZlAc82VJ9aucPpXr9AO41nCsOSay+kQpqxsAjaXP+Tw9L2cs
	 SuMdv7rmm5zu8+v3yEJE1cHJkpxg6UXjZZcFekNzNxVW2yfMmpshIp9VYKEfmNxBpZCuu
	 OIQ7IbXACm+6ttO7f3deKD0+2TxGWpV7/U6iI1DaGmM27BYP7VshZKZby4uwQfaq+2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645326;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=+slk1rOOHhy9FsVNaBi4UZuSRzG3jF3FxEWiHyv7D3g=;
	b=kf1Ph7SocFoyA2luR6cq0naMOzKiLgZJxDmsI1lvzAx6bOW3qoO8morwnX3U+ZEorYf8
	 6M8lbYYeaJYuFs9vtk91EJU+D8W5988CNu3mkKMocbyas62YoMZXBFXT+O90Gr7DEmTCo
	 iw88JJMkF5woGHSh9mZKz9zBbOjqUhicYvHrDF7TgsLeD9T5GtggBEhhvINnVuDPa+fGG
	 hdz4LLue/qoNa0kamVzA2rSXXnsWm5aNWPyQdZEQMbfXlJ2pSlzA9mqvf1NFrNNcKAiQz
	 OGgogwT/1XP5mpzf78ym8CQmpy40wIMEaqQPTJe1qxVuyOR7ElaRlmM3YqN1cyyySYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=byF4kK0M;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=29Hi4eKC;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6962606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6962606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=byF4kK0M;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=29Hi4eKC
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 15CCBEC0C22
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:22:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Nov 2026 17:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795645324;
	 x=1795731724; bh=+slk1rOOHhy9FsVNaBi4UZuSRzG3jF3FxEWiHyv7D3g=; b=
	byF4kK0M/kTkMYsPzUfT6x0XSq33Den993eZrfnf2lVBnINGEouWK7QdVjZX/dXE
	xhyiypUkslGBiWi6vr6887Z+7KkMOKOqV+vZI+IkPFfenqhGgZGrW2VGMBIoB3t3
	dpBr/izwXz+F6k8uOe85HS3I6gKhmwj8XC/Bbz3iCG8qIvwJzv11YnOpSAc9HCfC
	9/cQteGHJMBPt/urs+ICCWwh2UZyC5PucoUpn4C+3xmqi2YfvWrKXVRQab1zKURq
	wUzZWjYp9f012z6CAqNVVMATMllLwkJAwX5bIZLMHPn7s0Rlh2pCREE1l5KMzpzF
	ztCAQGiiJFjSg1yA9iVsrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795645324; x=
	1795731724; bh=+slk1rOOHhy9FsVNaBi4UZuSRzG3jF3FxEWiHyv7D3g=; b=2
	9Hi4eKCdnnpuCPbXKr84vvRicoD1QNjk22xOMjsUOW/98qZMcXGzb/uqKy9pIQcq
	yasi5KkgIbvLKbVmHBLYM5bEpRZ4CV8tGco/CCIv8W2pbqWrgVUSff42oI8klrrz
	s8M7IOHXTRQByiO7gBdnYCRn7NraxGVBeXhHx9qXShtQQQTpGrdTRbbkbDbAv00R
	usbN/sIHe5uenonUGPBw/L+Qlzki2j1maJ2yw7PoSz6aqkJhOT61P/Q1A0AgqJI8
	KbSmIn49QzaDyvZCyq42MM9eXZxyZIZPPPNJH3Z7SC5S+IgjDXL7KADxrvwE9sqG
	b9D8Sdf/3eLT6Tq0iKDyQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795645324; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ci8fACwSfJyKECZgBpJcu7JFEn6+6GsVVab0+lW92LgB0U0
	UVTVNsoZ1oP4BtTSLjijFiDvsH5LQ/wXd3NTLgZt4o7FU3F+V4ys7kU7ySJM/HjS
	avSZZ0aKxNT3M1iZTVpo6voNEFoLk/aw5vyEHhqX42651tfAfX3PhImekZ7IOwqS
	iIMphNlspHr4VSikPJfp9eAT6EQQgXuE9Qz4cHWlALTwZajxG8TbOQYNUedM/S/B
	IQy1CxSEjJPgeBuMItnQcMopalJJaqwgvR3hEl6BJjS2c2pyA3MVRaYfmYF2lY1G
	ADeLHZiRHsmvm4eFgdDp8V8XdKU5Cumh20fomfw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:chTifiZb/ZlBC/VFx6LGY+5mqNIJ1cUEH0lv+ovn6ag=:tkVvK0TLEiKGfGLpF5Kk+mJXNRs3CRQeYlEWNmesOzE=;
X-ME-Sender: <xms:jF8Ha-XYPtooHd-JY1wdOeMm09QLzVBjROxqmW52CTgN7vrDCF0woQ>
    <xme:jF8HaywoLq89vSksyTnfU78qxL4ciMomTFDitmWlNKZ6VTUg0HBGNHr3fnH_e-oVm
    jfPVvNg2yKMUMNJNd20v4E1F99T9TGkDBh1IevWpy7kG1d06m48-fsw>
X-ME-Received: <xmr:jF8Ha99kycgZRDft2OgZvMNdZIK0XUdgM2Gkhs7cJdLIljo-b5buT14w-SCosfCVg22xRneKp7nxHQRdkXiUiNQs>
X-ME-Proxy-Cause: dmFkZTGyuECZHMZOjj5xEKugkXPV3ZgwMbflbSZ7tibQHx3vM1WWphwt/4h17ilqaSeQZE
    P9Zojgb564igOVk0Iee/dS9wv2Xn+ULQ2ipM00qeNKN1S99v6glzV5d2MUld6QXZUVNXYv
    QCCZrzfaweU8WKI/vp1D6K1zQFtfTL9+XZuVxk8zgdeRaeX77VcYGhXdNWYdlNddVCW7vh
    gRwXBm7i9DHCUNCJxTY+J0tCrjXOc9G9qCDS58EtPIKsgptuKPjt/gl05JWrxsP8WSwt8Y
    zmH61ydZaiiMvjEtURrl32ISE87vo+jrnw4MJAcK64UK+lKzQCCpK+AmHPXMrGsVUhUkUQ
    zBPkAjDBv8WisXEhHi5VY6LSVgZjqDS8b2otYEe4OuCCrnNL7TD/J/S8FNXVTG7ruOYabc
    i8CiDPETpYRXqOCXvNW6VDYczSD3HaaoDk1VL6ShPrQDq/AmHw3yiVsqz8bpzwJ2OYS9YS
    hL/ZXLsm9m0YfI/0Pk5FsIeizCNHFHygJTBxogQX6S7Hg/CKhUohP+lqgMboBTrhqMk8mr
    fdU+l57N7N3UsAK+79hMYe6Ccifv/X1sAmxcopzNcrRS+8FRdcByT67CVcoVYpp8opGLP5
    I9+SXeEdr1sAemMeMlVLuwJ1x8OsQYliyk6N15aiAi1Y/dwLjCYopZ+vidBQ
X-ME-Proxy: <xmx:jF8Ha__SbDAffT1fVj9Qe6tH_nRcPQ7UE44kPLzrDL8PtVeRUJ0zyQ>
    <xmx:jF8Ha0U0SQDHSyTSjGQkvDQylRkGzapTidxaBe9k7g1bLFVV-RqOXQ>
    <xmx:jF8Ha0cSouA4RQ9luFBygQneBqDimXzJgZJe9x7LwRtlomgAmsG6hg>
    <xmx:jF8Ha1atrHwdkyeTsoHRp1axlZSeUWk_fxlZSOxa99cMP2_l13cFaQ>
    <xmx:jF8HazhTfVhKWzsCY3eog71mTFZqJH6wPABdcebnOKD9hXyXseEamQQ8>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 17:22:01 -0500 (EST)
Date: Thu, 26 Nov 2026 07:21:58 +0900 (JST)
Message-Id: <20261126.072158.1259538136818633027.tomo@flapping.org>
To: andrew@lunn.ch
Cc: tomo@flapping.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hfdevel@gmx.net,
 johan@kernel.org, netdev@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH net] net: tn40xx: terminate the PHY software node
 property array
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <871628b2-f8c3-4181-885e-ac42c8a3b40d@lunn.ch>
References: <20261124072646.3438910-1-tomo@flapping.org>
	<871628b2-f8c3-4181-885e-ac42c8a3b40d@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 17:57:59 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Tue, Nov 24, 2026 at 04:26:46PM +0900, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> 
>> The PHY software node uses phy_props[] as its property array. The array
>> has three entries and no empty entry at the end. Property lookups walk
>> the array until they find an entry with a NULL name, so they read past
>> the end of phy_props[].

[...]

> The same problem was fixed in the txgbe driver in April.
> 
> If you have time, could you look over all ethernet drivers and see if
> there are any more drivers with this problem. I don't think there are,
> it is pretty unusual to do this, but i don't know every driver...

Among the ethernet drivers, only txgbe and tn40xx use swnode. I think
that there are no more drivers with this problem.

>> Fixes: 25b6a6d29d40 ("net: tn40xx: create swnode for mdio and aqr105 phy and add to mdiobus")
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks!
