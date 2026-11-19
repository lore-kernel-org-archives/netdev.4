Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795119186;
	b=CkReW4czLEoZVgO+4qy/P9MsWEZNY1eV2xVTJ2kQbJMHdHDTfkEelYMsoLOQr+ZNl2e1
	 bK97Rwq/zTm48ty0ncFIBrtXp6RCiMl93Yjm369XJuUJDaJs/rCLj+QQfmK3rMG96tncf
	 5dgq1tH6CYX4a5ef4IBVTznCcr8GtTyiiEyV5w8icEBPSZ/IYPCsIXUffrb9vjPUG29JY
	 aiJRdqZLp5g6or8tXOI5vrSt03zj82nApTU0YEsGJrGoIIg21uWhG3ZKvUj8WkMbfTqU5
	 Xa7WAJgiwfBdtXRhQKan4seY9YgBpLsByFHK0rL/vTHaZMhmB6SDxQtk0S1dt2mWdIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4khV6mEF0FJ1/ADpxcAkFphboFBDJSIVs2FQrSfyQtA=;
	b=pz1bwSpBxGb9ENgCpq1fmwen2gDIeIIZ4kWXppUBvkURETUXUpSfWfZpUIrUkR5cuS68
	 yaUvMM0eLgmH2CQpwjwn3aEKAlnxlUzAaUWV5NLhFFXsOBGMconHDErD7GDlAuRbopSBt
	 oxxpAe5X4JGjyS6Id7KSutKIkGgcG7bC+tQmi21q2TWElqbXimlkx0p8UYWae8MB7kXKA
	 O/Rix0gKZKKEExob+VcYzeFVNHydUVEY5gcbnS2mahoghwJH58fGaB4HFpKO+ScQ+CHEt
	 pQPp2y10gjJFNS+iIuhQHIu3QOGr//+aJYoYBDrDmV1l8lI8V8Jca6WiPrpuKC8FWBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=EPCa8q24;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6D606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F6D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=EPCa8q24
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so145675b3a.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795119185; cv=none;
        d=google.com; s=arc-20260327;
        b=J9J6AdaYpITB9JwHXb0LrRNDM1UqdPKXRrQmWi2UAR5EARFxATVBWAvyM1S6T0XBKU
         5bO9k+0FovnUVx33AednyNXsYymJ3NHvuE5VXlwO0vYnq/IbN3KSp8WIgdMa+YDWn4co
         Kj5MV9OR3YZVY6K+2j3cW0/VTraDniIscVQT8lXm5z7cbXHywT9I/I6HJun2wYS3FZPr
         36kVL5/VeniHiCtuJWuUEs5jmx38TwykbrBHC6jvnacGUGhlyEJeJsWjt43Q2GhdzVvd
         WYvr1nBfQCD5k2murG7NpdotjYRLThQwJ2RrRPWTyjKBPeatu5pv//+vRhsFnWeEXUEF
         wmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4khV6mEF0FJ1/ADpxcAkFphboFBDJSIVs2FQrSfyQtA=;
        fh=nCPWH0a2SrzGijRaEDU6gf8pYULvW08NvZts+zbiVSo=;
        b=r4pXP0Zmo48A9TBsMcpMgPZ095S2IFrBge0XmKQ4aueSxA9Wyg8xLzVRyFmBMXYSPS
         OMYdyKnY+WEQZqMHSIhle0peBzn4q+aUW1v0she3Fxz12oI5JmL8QJ5e/lYIpqSvtvEJ
         POiLLVgq7jpQYx8cavlhOEOcUDrrgVs3Ilrbs8EOdJx/bGP5EuRjkbo5kbvJ6rsPzLvd
         i0TL8n5/rQym2SE6weg9857bm5tylaZPQV7nA5Fk3eGLwy9DohXxLa4r/XAQegAaM2Nl
         Fr7fPWGzrsZyvrqQj3gsRw+DWaL+pANOckR272gGRNA7XixJgTIzLYgfHLCi6pmMNSGI
         998g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795119185; x=1795723985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4khV6mEF0FJ1/ADpxcAkFphboFBDJSIVs2FQrSfyQtA=;
        b=EPCa8q24SwOuw1efncaNpF97tf642vZRPRWja05dGd5Vk16yE3j4qUulwHHvZoqnu7
         F3gqKSSynHVfYR/16BQkbsSuB8pKettOLoj2JANGKtM6gJ3sjwrDQO8BEKlhZ92+52GV
         cXz/nTvhq2MqU/vDdkr+b5g/Bd2AMHPZV01CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119185; x=1795723985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4khV6mEF0FJ1/ADpxcAkFphboFBDJSIVs2FQrSfyQtA=;
        b=kuogHkWvJjzlyRrroJ8lcZRqhVGe71pI4ICwnIDDTal3zvL1lDNxZHvMjU/nUDNX9X
         m9/Ju7jRGSp0Xl9+1oRcawKOajN9pN9YhEv5ArJWa5DHY9gKLXQZ36nU2p8MnQ/9ODI8
         vzdJKylAZaV9LlytEglenKcEDzgG3ZxsAtkD5ga9o10y3yEWHaMF5GamAtWrxSnpZuEk
         F0flPUQtHvAwMxTybZywE+udnzkxBzBKOvwIfAthLyndQlSt5pOkAPETI0+HZJB5YXc1
         OUMmSfoFCOQo9gamFt8pE1YDi8w+eLb2fC5eZOIXGtH/zcIMTnsSoqGtGuEKsPWu8e7+
         Te0g==
X-Gm-Message-State: APuU4Z8kOzM0C+w7v8A2GtqKx+ivZwVuB2cFHWN8bWt9TD6e1DdPysMB
	WyahD17Yl4CdL1cbonfidS3qPff9+9bcNjqOygMw0LqUI0qvnZEm136rVfbu3Y33I1mmVW9kbFh
	FQAvsILRsVR1NBboxEfgpAc5I0r1hQNowsCz26dUV
X-Gm-Gg: AYBFou1fqcnHFwKSshopHn9Igm5hY/DZj2fYpgIlQPFpk9T8dATo4jXGyv/5cRK4r1P
	ccAVMW99oGkjMCpsJOzo1RiKgIAOSe72g8iCKEKK2vw79IneHXiHTNuwtHsaH1jx/GAHcWpSEk0
	TFcD34ZmrQLws2ddae1TJkIVustJ1dMkZQlllQD2q0YN6c/O84bgZT1ETCb/E0ONHT8JusxF3De
	UqamwaaetNA7VLe/RkynCSDlP3oU+G6zyc7SaovUGxHjeBPj++GekXpXoaVgJ9egJPiL/oZC4ME
	pUBf4uq9B3Sq1BvW18VD0gYIEPfs9EHeUGrff4LtkJNaVhdYh6c+dgu6Wy/DTwqKzG61YIA1VwS
	KR5YJlxz/F+w46UFRHAmRhj8y8qicwT2kZz9LbIsMh8Ga6CLUXDE8wbvyA68NuU1PiIygq3ru58
	v58kh7ww4msaiHLajv
X-Received: by 2002:a05:6a00:2d06:b0:882:e3a6:27c9 with SMTP id
 d2e1a72fcca58-8c87c28e012mr636431b3a.30.1795119185501; Thu, 19 Nov 2026
 12:13:05 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119001539.2868072-1-stephen@networkplumber.org>
 <20261119001539.2868072-4-stephen@networkplumber.org> <CAM0EoMkLUeJdzCBxsknqxSKAZ2Q7WhAB9ifV_tKXne4fPxY7YA@mail.gmail.com>
 <20261119094711.6049b21a@phoenix.local>
In-Reply-To: <20261119094711.6049b21a@phoenix.local>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 19 Nov 2026 15:12:52 -0500
X-Gm-Features: AclHuK-WviYzYMuuuMuH_F0OQSbVyUbDFfwbruGy8h9rB34Yy17XJd7c5N5IAHY
Message-ID: <CAM0EoMmZ7hLf_BnUvKyTsBZVKiFCQ3Z6Y5Q3qHgORtQT9omhGQ@mail.gmail.com>
Subject: Re: [PATCH iproute2-next 3/5] tc: remove eBPF map export and exec bpf import
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, Thomas Graf <tgraf@suug.ch>, 
	Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@plumgrid.com>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:47=E2=80=AFPM Stephen Hemminger
<stephen@networkplumber.org> wrote:
>
> On Thu, 19 Nov 2026 04:19:50 -0500
> Jamal Hadi Salim <jhs@mojatatu.com> wrote:
>
> > I dont think this code changes in iproute2-next (didnt try iproute2
> > tree) - but for tc testing i use:
> > https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git
> > (origin/main =3D 9eee7bb8 ("Merge remote-tracking branch 'main/main'
> > into next", 2026-11-18))
> > libbpf 1.3.0 default and LIBBPF_FORCE=3Doff
> >
> >      m_bpf.c:107:25: error: 'bpf_obj' undeclared (first use in this fun=
ction)
> >      m_bpf.c:108:25: error: 'bpf_uds_name' undeclared (first use in
> > this function)
> >      m_bpf.c:108:43: error: 'struct bpf_cfg_in' has no member named 'ud=
s'
> >      make[1]: *** [../config.mk:47: m_bpf.o] Error 1
> >      make: *** [Makefile:67: all] Error 2
> >
> > suspect: the patch removes this declaration?
> > -  const char *bpf_obj =3D NULL, *bpf_uds_name =3D NULL;
> >
> > Attached fixes it.
>
> I suspect you need to do a "make distclean" and rebuild.

sorry - this was my fault. I cutnpasted the patch into a vi session
and left out a couple chunks.

cheers,
jamal

> There should no longer be and --libbpf options in config and no way to fo=
rce off.
