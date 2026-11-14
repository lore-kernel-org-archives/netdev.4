Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794687322;
	b=zMcZSaMxTUqDCZfl8joWIS5fIa5bv/VppavvZvn7+HV0slSQtFSU+i8cXGqreF0cCmFI
	 /JEg86D9/fn78YG34C/3OtshsO/15ucOnlzMFLIijlPmHiQnrZsc3d7nvw56TSACu2G/C
	 fAlbeDY6W3q9h3XuNxNWkk69qInV/LiFxIgno1wu51v1/77U4AnAwd5rB+MJSk2ol+uv9
	 EE5JvdL8KepeGUSErIW9rsBaDoTZwukoTATpKc+LGFZvVXi7wEMIOrkwrU8PEJAJ2QQTF
	 Am2yBb/p0mbN2FnOb3/03D0O/FDtxdlK8GR9BpANNjBnhheSQUio+vXcYRWvwgw8wzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
	b=kRFq+hDyprUmX4vadOEE0f8Y4hInHrv1Q6+tqDF1OWUaBJ+UMAS2+7QQDFiOKYetkj/P
	 JvP8RGnIoXw2mgHM9jEbZZMQ/oHHH7EOcvbcX/ux9P4H13c0dQdu+KlBS2g4YoXJyzZ4d
	 fpBerh3smp5Hi9ZsSlQlGyoLSvhfoqEAgJD9yFq6vecAB7OLpvA3ScX/0p+kj5IZC4qA3
	 HjjZabqE9GMDM9Vzkaz1F3bjAT7FEYyztEgQord8hL0Rd555KxiLCzr/K9Or1oDTZdQUA
	 iF6Igb8AvT8btJ8vCK+8sVrBbPXoaEsXQy2clbVJC23FxE9ILMLqEV6YzlS8TKp4+fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSr20zQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9036606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9036606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSr20zQl
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso420567366b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:15:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794687320; cv=none;
        d=google.com; s=arc-20260327;
        b=g34Bt0acFyvo7oQqFHNtFYRt7+TzSadpJO6Av5LGgO1RM1wjqitYLJ0HS6P3jNQ4QW
         AKKo22mNB5d+I8rdtGBDO+X8w7mVKhviPyKdW+PIwKkl5rOmx0Uq2eU0ZseM182F+Uz4
         6i94iLDNppSAx9mIQQ1t4h4DSAHqT49sOmUUamtOsMYwGXP+Bm+hPAy+frL9J1Y6u9gf
         CoNounIUEAcQgsMfk3UE2BTDJdYXgGIdr2JXcEe6GX0Ac/5O4v8kFoPoY0uO4PVj2arh
         RNpiifqEHIC0t56njfavvKwtV8UAmzt4gq3yqW7JRzon3+VQERNfgCi2K6Am5+cPCu0k
         nNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
        fh=M9AwwIM84alHub2ENZbdWPD2IlnniYHFm9kYydUyXjs=;
        b=nh3fV8nkR6J4padhiJJYPTK3D2aGXTl2Dckh9xYPigi+6ugLJlvg4kO5Q9xYPIbnIu
         Bgkw0b4p1vq1i0Fo+glbDyiQPGPEjvDPgEG5mbqGiI3tZiNLgKltqXaDct9JTAeCg9KT
         rJvL/GvbbPeYvzjL2OOcRPAbVn2bhg5fP7ls4s3HDjMaBdR0E4BeO9dNOCVxU7EU45mi
         KXGsu6TUC9mSPgUjkSpP2ne8OaGoa1/3PiQiKyWtQlewdrxwzVk5zxVBxTQJ7DYdTVKG
         n097hr2XX3eCtI5dQHTMoaz1U3tBcVeSIBYEmF1AISKUSmkeFREAkYM+iSruR0Q3IdXp
         1XTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687320; x=1795292120; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
        b=pSr20zQlFC1iP9Xux+Kp48qHdN9EmWCayxfgp/nuXUmY9wM3NYVv+o9yf1bHBgg/Ej
         I1Xfe3CgY8UjbjrUXo2AUqfvVHKrrLS4KYAa+ZwFUWWCMGlxcTW24QesIQfjragWT9gg
         6Txy6z0NDITzrhIlWOQORFqMkmf5PJJQaEdmFoVycBsmKpX8t/I6RXiRV47TSlLq5gZS
         1kIwjdfnFuerwlhVkDp2tqYlQSSDJMAiBFx3eK9OCuQREB8SUpznNYZUCxsLYDmbrA3g
         UUQmjIhXH+DtBsoPyiyKfF2t/j9qaorXqtAKYJc7fNBKWPstm1m/9tAVVquP5l8Lg6Om
         aDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687320; x=1795292120;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ejc0GeuWfZihrPmJAaj9/vl2gi1/D49AtBOnW2jsbLY=;
        b=RV2YfpseAIwqHa9iA28MyYE4NXr1CXijbczQJugY62aUDPSDiV3UOpOfHPlm4suM6I
         01GQXFLZ9JGnz+9RKcJHgH+sTxw77GTlzfZTE/kiPOJsHtbhGaZBXp9f2WZ+4kRXapQ0
         7oI1LXK3K6REylkTeZ0XQyt1HbDG/fBCzWV1RS1L4I62inMjfWse3l4nD9k+zXHlawT9
         PvgYfyPWwAiz0x85Snm6VAqaaoEfy3wwdSWvxH0LbnuzoVC+FIhaBr5WnUm1Z8FvwGMN
         31DzsZL0SgXYd5BmAp1O0yY0Pb/3QThuu59kPtoQLuRYXi9Oq/tu8Re9bpiDFfEygnBQ
         ItJQ==
X-Forwarded-Encrypted: i=1; AL+hErGmnTRT0yzHmRAvlOCBp+YvG6RIvlPZo66KJhGBSJTtwsniZ0fu8AGBQ0pGhkCR5A/bkhX1lFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kyH3XGyPHau67IFPtZGQYqocvPCltCVDbaqvhR5tUNU11AwUC
	U6qS8b5H9zE9IazNGJAgGWnuEDKWVcABZZZ5H8u+3oKw7Vi+XyDPiYznY2GC5KC4cnC1QJElXLn
	YzMdgiWmzos3FewtBql/r21cV/RxvmFU=
X-Gm-Gg: AYBFou2K75jVPeTXQ2Mtp/YhMe0DYpGkd/T+n7btrSBBXPpM5YAHYiOmGrvEk1M6/7g
	OCTlwkHmzMTtgs6ARvEjIGvnCRcsIRqb0d350IaM5ILzwzmUrMsxbWH4idPVNgAMxRPl5APf2qE
	c1WRUun5CAKle1npayTyfIPU1WBzwLjWFuYZmD475GiZkY+6621RudaJwzEC+hMma9YmQOehyPM
	l/z4+/jf2oshOE9Ue7e3JK0sa7zc76z0xJjjdy3H1M7Aywhknwb5kvKXAn0cnjRA9yY8HS8RKKs
	R855FFUXzGKwRxDhN1gQXXv7nj2ywx+4hiAxgaRq6cVkapgKNX+H+2ZhjJFelQk7QUGx6XjWKgh
	NxxGVb/kZm9fpaY2e+cWyzSYjSwdLmxlL9msH
X-Received: by 2002:a17:907:3e83:b0:c3f:d912:ff8e with SMTP id
 a640c23a62f3a-c5096325a84mr517546866b.16.1794687319796; Sat, 14 Nov 2026
 12:15:19 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de>
 <20261112-rtl8365mb-dcb-ingress-v2-7-f8e6fbdf8c99@pengutronix.de> <CAD++jL=k8qb+Z3gpvbAZdf7sSqeV3QKZ+vgY-Qxj__vxrX3cfw@mail.gmail.com>
In-Reply-To: <CAD++jL=k8qb+Z3gpvbAZdf7sSqeV3QKZ+vgY-Qxj__vxrX3cfw@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:15:07 -0300
X-Gm-Features: AclHuK_6rjgfRpTtCjZ6KS5XO-9DuMHYibPlgy8wMhfBLBIgW176Gb8iFLvkORA
Message-ID: <CAJq09z62DpYe0totGrR4dv-o8_1MwK2LQzyXnm+E6hxcYoMOvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 07/10] net: dsa: realtek: rtl8365mb: add QoS
 baseline and DCB default prio
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> > Add a shared rtl83xx-qos.c layer and the rtl8365mb backend behind it.
> > The backend programs the QoS classification tables and one
> > priority-to-queue table at setup instead of leaving them at their reset
> > state, and offloads the DCB default priority.
> >
> > The switch classifies traffic by the port default, by PCP and by DSCP.
> > Each source numbers its values on its own scale. Use the IEEE 802.1Q
> > traffic types as the meaning of the switch's 3-bit internal priority,
> > and map every source onto them. Best Effort then outranks Background,
> > instead of following the raw PCP number.
> >
> > Keep the driver-independent dcbnl handling and the ieee8021q priority
> > conversions in rtl83xx-qos.c. That layer programs the chip only through the
> > realtek_ops qos_* callbacks, so other realtek DSA backends can share one
> > dcbnl implementation and only program their own chip registers.
> >
> > The baseline trusts only the port default. PCP and DSCP stay untrusted;
> > classification by PCP or DSCP starts only once the port trusts it
> > through dcb apptrust, offloaded by "net: dsa: realtek: rtl8365mb:
> > offload DCB apptrust".
> >
> > Every port in use defaults to Best Effort, so all classified traffic
> > takes one egress queue.
> >
> > Select NET_IEEE8021Q_HELPERS from NET_DSA_REALTEK, but not DCB. The new
> > code calls no DCB-core function, and DSA installs the dcbnl ops only
> > when CONFIG_DCB is set. The QoS baseline is programmed either way.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
