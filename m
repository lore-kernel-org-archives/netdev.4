Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794670357;
	b=opyuOUK2TZ2jX3TScDHsMTNtU07Qpvf9fEvUmJ99bPbB1FxE3P8XWaRrnWrDfLrufuTB
	 iEl53VTfXPcyRIaslrFOidTlNkjE4CtDHtCOJ0W2qHCj4nAVb6ZHME07QF9KMUM/Dtc+E
	 iqksmFrawFi5RkcySpURI+BAZHvlXrcewz4FlLzVBPaY1FvGBT0ISwCMp3vk7+zWFi+Gl
	 mwdM3etTTCIrka+gEQP+4kGIlV3Xoj83gujDglVvY749I1fBFjsYTlXOm+PBxKGnMEf7V
	 HzIB9ZIBnrJ/rVuIXy1lhSTreIJrztoBjvOQqNl88dmnAmBqrkW53LbE3atyBewrkWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
	b=EiTmJwxKx+CGVRmm1AO98+OD3Fg8JEEy98UvY5MjhxTLzsfZ9TgCB18j1M8br1aikSHW
	 nnB6jBUc3lthQd5ps493lsMAplUKtoH89gTNyFvHllgbmQT0v2PUKAKsjnNTO/n726rYo
	 89yTaJr7osv834Co/pXGUlwrZ6D+3ttTQnVg3pP1tOy5J4FK7RVsj/0Pha0I+yD+iDaNp
	 tMfD8ikIO6l9jvaDd6sUwpnJBtuUCvbjZF24sakvXkoj+XPoE6JikDI+6zazzS9vTkMc0
	 lX8zbJFNVsEN2Acy3Yu+q0d8n+7Yqm3TP3pd9aYG0BcZLkxJQlODDqmmP8jivpqO48g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35006606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35006606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgrOhZRp
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50cc7540b7so287766b.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794670355; cv=none;
        d=google.com; s=arc-20260327;
        b=iqQBBd83CDxE6LLSo9jkX5zItOOv7SIHDyvM1Px9ZiOJAjdol1rbOPHWTqhpHevzoY
         5eQF8nOWQgEKX+IZZjgYIGKRSprhZSFjFf7X4jIyqNn0LoVybODoOwUCZpIopHMYw4Wi
         a2ZRf+jvcjlwWoxwN1eeJzGDVwMolrQfPsVhIlg5HiDcewKM5I3qaPIHRqSLtac0SapS
         x3yZLNmaHnmMVMR60n1SNNdFQ/+0hhnZMJsH2zFEtWMHm3OjIBt1jUcMgn1xXm+dMsKK
         HL6/waftGGHgUn4zae8TaE4y5xNA0PyzC0Pm+/oBtrPwwLTAbRMPqpCi3mVuiDtJZgbh
         xFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        fh=AAwkIr9L7oWs9EQ86M9WSc7kXELngaaFJ/6BqPtjOG8=;
        b=HkxMJwneLlqlAYiR2U1LJkpuIsA2uKZ4kE5X5Hq1I/KiS+DXDvVz5VfQ27hCdx9j40
         ry4Ih2wx+/BAwvBNBPmGsRRbNHfyOlcRqvEAjZ4sPYkAuGN3/ivAm7jExSoscbjX+MOE
         UQq+N4meyIz9qMWOVgRlVevnRzc2zM4Bv+Id36zXnyyxqAJ1ZOg+98e8QjiV6tqRx38x
         +/Ikzt75bH+gr6IWg9CLU5uxEUaOjIPsUkh87vw3NwFQbD+76uolR3Suv3qgu8BzRFqo
         lDxu1xzBBFglJMKVx6KpkSJwSdQ+fflWqMvYMtpmDBIMwR90ZY72IF0B342/+PejrlBQ
         RNKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670355; x=1795275155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=pgrOhZRp05KImLhRrhLjrWt50iEsX2rldYqswYgsVQNsni6GZ7hMZFhhEAsvzYl+XI
         pDxmlgRtgXeVD282942Y9MC1GgAIs4rNVhm9odZW/f2y2srKDssKPHzL037mIIt7q6UE
         tYe4MH3o76oQ5NfhwSZxAoN+RwnvALSJclUP8WgvpS8B/+J7dSGb4FwmSL9M7f+4e7TI
         jPqnY564o9gAucXpqlDNyAV+Ml9dr6o+UXPsD1dWTw3G6g6JvW7b6X2gsL2fuVsOMB4U
         NYynnyQli0Zr172tTLKl3QPS2vt1trdjq1+3vrarZJXPCSRrSjs+1oogfjcKHzGciZ2B
         zskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670355; x=1795275155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjN6mtWcOCsjlBrJP8cJGczeHs+0ITKRtbxV1uFNID4=;
        b=1xd04QJG5uX0Z82/9vjW6aR/ZDOo48qisL7C2XbPNvlct7jjttoKzHED6qfUPOs97u
         oFIpBv52KPV9KRK7WE5DoMKEA6g/X8/LBt6pYEXrR4awMdsfpgQiFMq0ziBIRz5Ywxws
         QBUD9rq0NhLcOe9pdQW9chBtX7KrEyLsQuv4uxphbsfWAoGRhjRgmjPZXUwykCPIeXpW
         8wMZyMUL6ZCs3W//RDBZ25YdE/Rh1DSr8m0WKtrdZ2Sur8zmb9ljmWRjv/JI/vL3oICF
         ivFuvQyIpFX9MTzdC5CPIsAvdY06ASBHUG+QvlEcS09mXDJ8U6jPLI7OcjJKqH3RpX3q
         eDmA==
X-Forwarded-Encrypted: i=1; AL+hErFxTStr+FoIuUhina77pXTJ8bnIw6IHMWWAGjg4DH5Vuy5aSnvM+/ttz3/oH0M3vUBumNvvMiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6zgTmNG6F2+m8E3Z4FD3htb8lMYiCGUBkmScPlu6fraIJKm9e
	xkX2cHvsLiVQyLJCRJprzSgtMvsJxb/YUQ+3U+arv5d3Q9e2c6m92F0pq/FppiP9ANsIz85q+5c
	M2qsCsFiIQjhv8rKUc/Ea3fYrldxUQIo=
X-Gm-Gg: AYBFou1sr4C7QsR3fnV3eC4LcIRgBp8mPFYcs2rnDf1lRJxU20IeGdu63sbEZBmIVbO
	WmKlmE1a+/VT68FFl+TvipqmgMMiSjDxRaiKZcjB3jhVwerrSMMsC0BlB1QxSBGHzSd3bqdmUwg
	wfaEGDIzd0qjv9EtnCmWjQC6/RUWx9k1ymftzmdZf1u6FpwxR9oCGsXupvGg+IAYJ6hfonJczFB
	1afzcVcE2M2kFVJPX82xDivxwI2Lv0xWkUuxnj5MxJQ20inDoEFhiQcyjWe4sGfV5eeMURMvhiW
	yOhGkEBwW2c2kgg5Zirq7BHZq5PqUJ6MFI1W8J9qf7+legmcZYAaIB4zItTvIVhHTjNOcIfMrDr
	ALR7qChuc21P2l69gj2Rb96HQet2wzv2Yalv2PA==
X-Received: by 2002:a17:906:9f8e:b0:c4c:b4fe:c9f1 with SMTP id
 a640c23a62f3a-c5096385149mr526284666b.35.1794670355209; Sat, 14 Nov 2026
 07:32:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
 <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com> <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
In-Reply-To: <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 18:32:24 +0300
X-Gm-Features: AclHuK8X0DQZe3Z31cK9XuFE51dX6ITpI-bm5svIaVnP3cI8G5bXUmovC3tRnYs
Message-ID: <CAOPX746c7uJt1fhV6s2=VjjeinQs+R4zDmMqCO3_UqkMrjzMew@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Sat, Nov 14, 2026 at 6:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The LED_COMCON register does include "force-on/force-off" bits,
> > but i have intentionally chosen not to use them here.
> > To be honest, i=E2=80=99m not yet convinced that they need to be added.
>
> They allow you to implement set_brightness. That is ideally the base
> for all LEDs, being able to turn them on/off. If you can do that, all
> the trigger can work with software driving the LEDs. You can show the
> heartbeat, shift-lock, and all networking settings.
>
> Making use of the hardware to blink on network activity is an optional
> extra, reduced the CPU load etc, but just nice to have.

I got it, thanks for the clarification, will do.

Best regards,
artem
