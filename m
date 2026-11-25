Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795608659;
	b=X6A8k8cdg0mSSQHGP3OBnaXV1SEp/WgC0/vRl+OQD+S5n26ONqZbS394jmw/5yZ3hfN2
	 Ubhekq+GG7EIU4Fxbm5bLxfVLBwU5fVUWRcv65iJynw7EdiZQRJYtoEp8v1kbXJ1Ja5rT
	 aeUCyCrH74hPKRa5lp505olAVJRWqemJX+r20TIkVJOa4xixRIOCzNUqnuavDwjFPwTwt
	 oK50UTBWyYbiVOPZXQQZWu09WWnRM47ZjG4j1DAwhR8tItoaIb7/WCtjdlSJAlewaOkj/
	 aKktxNUUEY2uMuRwV9+9ib+NbRb6kqtaxu7ocKT7cQJsnl1RRpif2iTeHbbsL43HkDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1N96GBecg+GfJe1n2xMgqcFN0Pfbl8aGDYu4m8D5IIM=;
	b=UI1iCnqcoedPTlsH4Iz6n1XniUhk2JgoHc0nwFwdOHI2UV5bISZrscBzHpt34Qp5ERZp
	 tG9jIm7XF8RPJHLCxXql1GD+vsyLSWL6KXV4/xwl1Hu9qgHqeEuCnbQf2KDOD2+Uq9WEP
	 gP8AAGlazWO2ZWByq3AY+AhZUeYwHqsZBFGGmyERCGPGD6es1T9InsXyPSzz0rfUo5YDj
	 fmIgD2avMt7BVHxW0JLCmjqyiv4qFBnVinNlEfYEMoG8lzDY+Ui5l61vKti/CwYT9C52h
	 E1Lkoc3sOYvvcg2bjQeYI6OAM6ucQbWFD1v+fBwfUHrnPPWRyLu9hgmfjz0NfFqhJvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3w63dkW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.68
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D21606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3w63dkW
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so5344339e87.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608657; cv=none;
        d=google.com; s=arc-20260327;
        b=KNJ485hEsuRFMdyrQ394OAXQKXQxzm/EMVO9fTbVWRtKuD/FPvYdp2M3N0/iTfe90d
         0fng38SWHt6XtFr/EJuYfKB5t4XcgDfsegSQ+FcrPSrGCUc2chsyedWJYd+FLvi6Qi3T
         DXX8GhdhEwiU55abdN+5P46Us1eC6TS52iZgg+6BszGAXUfJxUGZUm28k3BGF5zwO/Pa
         bwGfHzFWNgpL/+fxf3zmC2TE6KNfxoG7W4NtqMypa9aImvRBjKoK3/LvolTcUrGsLM/i
         NV0W87MQcCkukl23OBuOeSLxdqJlW6sWZe6guTiYZ9yn34/20VlDG6v2agBGzrjkJL1K
         pKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1N96GBecg+GfJe1n2xMgqcFN0Pfbl8aGDYu4m8D5IIM=;
        fh=QAexncPFWwfUg2rgRtJjNzpirm9irUJYDckCmNz+TyA=;
        b=oGilUJs1h8qX146CW+hnskCpW6KZPdzx6aOmC8N5z40emzBNwZtNB9lxRGLOYmiyZl
         HykZ4G77rnoz4urzTU/I4BkehgwQobOHNDFJYtYu8vshb5LEn46en28so2YcMOf1a/Ed
         2gKjYks+sO4qRSw441pe/lfDXO8oP9aXNPUKxLWY+8wpbywVoxtS0aWj9hEqAO47x0mK
         VhGL2bkhdlUYKRTCeOAyy+LnNlAUrgRuGkpumU7ssQTR5T9e4cOWmkqf6eXZe/BaiWOE
         crvF029OtpxlcUpP2ywONhmyDIJRUSmL7geYYrZS1awwZY2mF71NJZH+Dnsh9M0WPzMr
         FC5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608657; x=1796213457; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1N96GBecg+GfJe1n2xMgqcFN0Pfbl8aGDYu4m8D5IIM=;
        b=l3w63dkWTAYqvjFynZS4xnX29jt+TVSqB3Oz/76l7Ut4ant2iq1JBmVWrwsKayCB5S
         C691m1mTzUfYB9DIfcn+WJpmxlcLuB6Zby4PB5S0Fk+MIYiEPXjCF+t7EjEefNdA7rhv
         Mbovmphlm6yn/82ldH6BiwnmJV0kyZuP6eLFzgRPM8AWuKUKXgWLwkbNGMt3yFusLoTu
         bn2cxWzghlhAVpOdR6SgG21IlAltobxaY5wgK8FuezGi4dsKOzx5xebyWzbviUPpCqy8
         XSDBTL3cgYQ+EFredd8zR1RHXHEbEfkh2H+JhiI/2I509k4M5D89k6+AciY908cGKgfl
         FLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608657; x=1796213457;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1N96GBecg+GfJe1n2xMgqcFN0Pfbl8aGDYu4m8D5IIM=;
        b=u+nwUxuag7DpJkXulDwjlhmS+QHWQWLsh5rFwJMBmYdzEGuhCbAS8kes8Wi/6D89NA
         aqbt2269/kiad4RU2Vx0iXvfYNAg9/g5nL/sLWQj0Pd0Ps+P7/AaC2Cpqr8LpO1o0r22
         shEjAR1MZtOr6NLfx6MVeLj6q1ZhfAkP/0L3Q0et0tDpVPvIs+a9InBGFrD73tFyr9Rk
         QGkkpR0kJS5biiEGLK1DWvkUbEmiFPu/bt4IdH/32a+o2hIRCcq2P0t7+QvR9FE34hyh
         GTw8BRSGLiegW2ld6HAUmckaGWxetTkvHkDRNvXrgON6w/6SoAmlOEcwBIFWo+TCT3mp
         IcyQ==
X-Forwarded-Encrypted: i=1; AL+hErEmxMyGq+HASCxh7gYtEYFJXNCbO1ypoZx8ZhLD+MUac9+dZwm+DOePiIO52XQvBKy+0Ox9TAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++CufnZZyPXM95Pgz5w2oZmhjQU8N7FIG3u3B/DyB8mO18MEWH
	Qaijs8Enoo0vTxwHkCefC3GcGEapuFgQtI2F3JX4nGnvbxAX9pmX4+KvMnUf4FWznWueBSO4EDt
	dSRYddPk4KkGj8DbiGESIFXRPnV76lGM=
X-Gm-Gg: AZFdTZd3QBmBxdG5Z7A2sDOz0euGNd+RzA7FTj7FxFV9X1yT8avCAvJCh3I2l6qbmLZ
	lX37a5Ww5GhgrSVUSrTR5/WO+wCoZA+jJFDCdjAW5TkMQmVJ7euL8kbn0TQYu51W0CPiSiz5i9Y
	Bcb0i4MU8R6H5eA6DskYEVLSbKemy9/kRbVGFyEZ41zdxnS5FHX2ccrX86jGE4qUYR6ptvxBFhc
	BsW+Pkd3CLZyCkZ0oRypnsw/yKqGwTcrIvZ/2xRiwvdUSg+evYPXSAeB9udpvJPUmusOzCp4wi+
	uNBpcAoIhhqLn9Rh9oBysuHkI1pIfN1dflg8Ku0XVYDyX4BdciojYYfoD/ofsNLbmGynlYqsyyK
	sTscIHnuGXqMSByjezOIqQwrS7dicQYskd3Kz9Q==
X-Received: by 2002:a05:6512:234f:b0:5bf:d938:b80b with SMTP id
 2adb3069b0e04-5c1b7c42d5emr4912988e87.27.1795608656760; Wed, 25 Nov 2026
 04:10:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125074617.629026-1-bsdhenrymartin@gmail.com> <5f93ca8c-fe7c-45ec-9b88-4817d1b6a543@redhat.com>
In-Reply-To: <5f93ca8c-fe7c-45ec-9b88-4817d1b6a543@redhat.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 25 Nov 2026 20:10:45 +0800
X-Gm-Features: Aa3M54p_62Oh-dLFBbck65__MmZTYOkFdjzUBkAF1Y2sTJexzGy5dWx3cXJRTfM
Message-ID: <CAEnQdOrfsmhVfbznjSMf0YZhaiNVvt5WTqJAko6_QJ4toSCASA@mail.gmail.com>
Subject: Re: [PATCH net v3] ip_gre: fix stale header length after erspan
 version change
To: Paolo Abeni <pabeni@redhat.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, horms@kernel.org, 
	yanhaishuang@cmss.chinamobile.com, netdev@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is weird. The patch is broken, but it compiles successfully
> (on some slice of the CI) because the first chunk is applied without
> fuzz in the wrong context. Still causes CI build issues:

Hi Paolo,

Sorry for the noise -- I have fixed it locally and will send a v4.

Thanks,
Henry
