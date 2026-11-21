Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256273;
	b=iGLtxVgv9QitJfhfSDhXauZJvgR4+zFyAjyGhsWaWJdlosR+Yi7udoNpVi7YC4ovtgTv
	 iKRsH+JKlHMq9eNWxA/vPcxIL+XMSrBfYut3vc2rYbRjMhefNYj4y0rE1Eoqguea0zCta
	 dGUcyRm4gWcdrjXG8EvpoOP/RqYPeBtuAiSfYm97hMGit9QZEmQrMmHV2e0QsxYzd61tN
	 3uW/t8NRHI4c4oDXdT1+QuCRSTLKmUdVmej9UMaUBhh0uQk2yl+XFUmnDwUHiqNlAJCIa
	 v0qC48lFvkjE5gneK4iG2AAjWeGQuboENIhuoC/cHKrTS1erKA3SVpWBHntzY+Gwjbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CGM/3+U6P/3Ix3u1vwt+zgurCpv7ig5u/NcOCPf3TrM=;
	b=JGpX52+GdCJsw/XwUb+Wv3j9HifxYrOTc/M2vcFZyFQ057kArCKiJvtIEI/zLScVdw6v
	 WH8Fol+pmduagekRoDgzA3qJJe1MHvtwHs7oczxH3y8eqf9s2lm4H3Rm24vNMNVhayG13
	 MsPU6aC8TjB21cdQ9zeQNY97MdgbljmuxvR8Sez86kPpE1rZhZc7OH4rdwlbAJQ3s4Dh+
	 RXxCEN/xo63le77D/mO6J3UvTaqNW4hGwb3rhi+YWGyj3IJ5vydm5EIW4CI5uryuD5kQe
	 045sW8IxDXoiIQs8v+WOnzW8d60pTd/gTPq92H77Ru+0iJNfB4AplFOhAyjx1zNTNlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5OlWEoZ;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435B606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D435B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e5OlWEoZ
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1046538a91.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795256272; x=1795861072; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGM/3+U6P/3Ix3u1vwt+zgurCpv7ig5u/NcOCPf3TrM=;
        b=e5OlWEoZb92VIfI4w0ixhqrsQyV2A1MVM2CjecYEPNZ+mzk/aaQMjPGZOw00uv/FcT
         t647KEDokcKq6d71R4DEsRtMLC1jLkJUJrpNOgMA9SNl5ui246wJpMlX8LvjqmsDlSML
         QbfFEc0VtrxixmDUldXP9nvZFGMpCV0EJaqepZh8f1dVsQCNA800aebvL2qgOSG8QXq8
         3Fs0q4sNbfiE+Pv3YQ38WadZVoMGpTJMuBMmlfgFnHV74ZduH69SX2wgZWEzdPYquuCs
         S/v6Er0Jnod7eNFMY3vN7puAXlHpqvPMsHrNoDYXs8EUBBDzYtX1HEONs1iPi6ha5NGr
         /Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256272; x=1795861072;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGM/3+U6P/3Ix3u1vwt+zgurCpv7ig5u/NcOCPf3TrM=;
        b=XuWiDyuJMWBzkWV9AhzqcJue/hVVxusz5GAkb/rULCx/OTRn2rObvBKZ4w0TOP6jBg
         4LLbRhh0Zk8eNgofjrVgnp7GJjBMEIHTwwmXje9NL2kY0yo6XXcM9GlaIIfjEo9OLeKT
         MvCnIOjJBVKDi+8wFOCypPwSyJQ6rCqKscsFbeHoxpK+dJyqOvaypJ3BLP44/oWZPNsr
         Gup+TTAjLv+XZPsQnizTHWkgBfx7wSlRusZcU28oefVwLmLnKxpXKxJEldnRDXFwM3C2
         X80FC03MyAcM9AM4grPjFY3CZfkkJhnGdAAUWQHudQFhvXPU/0Krl+JpkVt1sX3wUAzw
         DTXg==
X-Gm-Message-State: APuU4Z/DNhTkI31e6ZC7eHbOPS/UtvOqgQnghJY+6Nd5m+jQ7r+tS4Vb
	Xjzi2MwX+BKdZ1EN4aqcGVSpU88qZF8FZpvsEwIWbJPd0bAbAKGXppbB
X-Gm-Gg: AZFdTZf/Zwelx4j0CP7FmzJgHW/oL7xw5/mgom4/T/BmLZ8jkdOF7l2bzIo2iRywIcx
	RVXksktmPFEzeSgTtEtivwuonEYzSi2SBrKE2Jmlp+Iu9Mpiviiq/yBO+6ackRhwnRoAQZtHpc9
	3u3w5/1OAI7InQkfJ7/eSVEpMMgfmY2EdN678CZZkvwhWspRrAozr/xRHlp0tNYB4rbw4mOeARX
	8ep049JsM62cxGV7DGEpwfPr3jP7bP/EGk3905jQwHp/yeN54/sSkM0KzY/7RI2oB/uVsA3Komt
	9KT1E7vUqJchr0J75jvrVeocqcXujQLdnhvu1/uHJI74yf/jXKZLL+rrO3brGyKYvXykuB+09PE
	GrZ7/oXQi63o7SXcKzwDiZIVxk7OQIhr4cQ72nRzrMi7ir6DXiFlp7dYuyLoza3EYDSlWgHWKWy
	OLEpxK28SWds4XIdgMHJ5pznKzxPZvOJUOM7w+sijj0lwJ0XE8il1ChIkKPEbh/GfeuPzI9y1PG
	0jpkYa3NHtEBUdq46zDtPeMVtHG482tkRqrfBucRGOgZtaZBqhC01W62ybDClJ+2+KfJqBTDocz
	TmG1slTVsbF6qfKP8nINPPC2Puj2rSMNzvgtIIn3vb7B7XiTkMfsV+fALnATTWeBE/LI9XPqYeW
	Uf2j81M8=
X-Received: by 2002:a17:90b:4d0a:b0:3b4:1352:6ae with SMTP id 98e67ed59e1d1-3b41c905981mr4992815a91.30.1795256271992;
        Sat, 21 Nov 2026 02:17:51 -0800 (PST)
Received: from reply.eml (awork078078.netvigator.com. [203.198.250.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm11859916a91.8.2026.11.21.02.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:17:51 -0800 (PST)
From: Yuqi Xu <xuyuqiabc@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
 David Heidelberg <david@ixit.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, stable@vger.kernel.org,
 Vega <vega@nebusec.ai>, Ren Wei <weir@nebusec.ai>, xuyq21@lenovo.com,
 Mark Greer <mgreer@animalcreek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?=
 (The Capable Hub) <u.kleine-koenig@baylibre.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thierry Escande <thierry.escande@linux.intel.com>,
 Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH net v2 1/1] nfc: digital: fix use-after-free in unregister
Date: Sat, 21 Nov 2026 18:17:30 +0800
Message-ID: <20261121181730.58295-reply-xuyuqiabc@gmail.com>
In-Reply-To: <20261112151208.496636-1-horms@kernel.org>
References: <20261107141910.549465-1-xuyuqiabc@gmail.com>
 <20261112151208.496636-1-horms@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Simon,

Thanks for the review.

> [Severity: Low]
>
> The commit message presents this as part of the unregister fix ("handle
> its MD listening state in abort and shutdown"). Does this abort_cmd case
> take effect on the unregister path?

You are right that the unregister path itself reaches abort_cmd() with the
state already at PWR_OFF. The MD state handling is there so an MD listen
cannot outlive the device, and it also changes the normal stop-poll and
suspend paths. v3 describes that explicitly in the commit message so stable b=
ackports
do not treat the normal-path behaviour change as unrelated cleanup.

> [Severity: High]
>
> Can this assignment overwrite an ignore_timeout =3D true that the IRQ
> thread set for a timeout handler that is already running?

Valid. v3 no longer clears an ignore_timeout set by the IRQ path: shutdown
and abort only set it to true when cancel_delayed_work() reports that the
handler is already running. The handler therefore sees the flag and does
not deliver a second completion after the IRQ has completed the command.

> [Severity: High]
>
> Can a timeout handler that is already running still deliver a
> completion into a freed digital_cmd before this point?

Valid as well. v3 marks the command complete before invoking the callback
in trf7970a_send_upstream(), so a timeout handler that is already waiting
for trf->lock cannot complete the same command again. The timeout work is
also cancelled synchronously after shutdown and before unregister, so a
handler that was already running is drained while the command and device
are still alive.

> [Severity: Low]
>
> Do the in-tree implementations follow this new contract?

The contract now allows driver-side removal serialization as an
alternative to doing everything in abort_cmd(): the driver must ensure
that no completion callback can run after the command is freed, either in
abort_cmd() itself or by serializing removal before calling
nfc_digital_unregister_device(). That matches st95hf's rm_lock/nfcdev_free
scheme and trf7970a's shutdown-plus-flush scheme.

v3 has the fixes and the updated documentation, and is now sent as a
new thread.

Thanks,
Yuqi

