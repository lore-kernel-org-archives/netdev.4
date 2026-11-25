Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795576059;
	b=ThQHhzwQD7Tk2GbOz9YfZ7z0ZtaT4oI+xli/fD5RiLEKr16vHerejQrpY38EhxrDMBM2
	 VlFkezubeflqmnTcYpP+KU2TwdWgRKrleCXXJh3VHqAF1QWzOxfN581agyyg/kJ0Aw/11
	 qF63cz0uFVPzYxffkdmLckZGetgu61qD7xUiYWrk0+PMftZtkwyIXZV1Tv9YoEUfMdMa2
	 k6KCoxfQcEcAnHPImhq7Ctzc8uGXJM8bc4IUILKetp+7oMQDRQtwHmDvp1i3RUIZ1b6Nd
	 Ha0I3CBe8jwHdaRdqE6N4ruxxQjkla4Jy/HTzJEieOaXkK/AtqUrsDS9PWC/PqDbfdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=epUJ8mBvT7a5Ze18NVgi9Ga1RB7+0+kQi2Dgv5VVR6c=;
	b=ZYRTQ8N6wi74aob8EaJLGq4VxWJPh+V2xgIJ5LVeL3SkE2SqKH9pXOVNUa2gxvZ5mxdw
	 PR7hHKGF44RKHCI5VNp19A/qYQ1PdizG9IE28wqdPrYNAeQjZH09Gn4D+SUbLZyJlJRN3
	 6tGDvm5b9u5jvvHlLM13cOezOtLhaw5krQAaclEuPhv4RSsiTTRtDqTzOOu+fGBxA957a
	 tRqeaUXLIBkCWtSm0r0ZGJ8zm1OUBL6bMzrWQ4cRGyOvNC/D9iYk/3aGoEG7vHARBbm8w
	 /4Eoiy4N4HYyXmodgOZzmunwsT/8Qk40BnQTCJ5FQrMoVHhhFDHW9lKxV7UKmQ5dW5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J6s5p04J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09191606A33A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09191606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J6s5p04J
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5188e17487so368951366b.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795576057; cv=none;
        d=google.com; s=arc-20260327;
        b=PqCofTlZzAPXGgyZlsq/ekOy4qBE6+tVqJvxTxq/568mumke0XMqhu53W2TPm1c+Nq
         NGGorSKEW+RpzsCuRGaSmfwVKeqOFo03/KWLNp67RProgV31pS3pY4iVhyXQyCkDlSg8
         RPwSN695O1zElwQW6oKG4WG2x6KxnXM11WkBnKYLWHiqCb/14dgQrCtiKODqcIC2XT7D
         1DKNYeveTDhunhOCDzGPU/ISfjD2XMkcfHI99dSs5tlMHbBXlVYrO+2OHoJuovt7BzWX
         zA9cQBwKZ6uQpLLD3ZLXc20D8FE7E8ygAytdXJMfjDiLGGwxuRKq5LPZ4yLZDeLf1T0u
         gg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=epUJ8mBvT7a5Ze18NVgi9Ga1RB7+0+kQi2Dgv5VVR6c=;
        fh=1aYEGjLq7d27rXFzQJPGFDOFo/5pggIZ9d9L8YejjjE=;
        b=LwCsHou/twdaAd/tx1CPGKhENvpmsR/YDahqdpmbjLoDStHnU+lstz/b/N2rhK9PKE
         Y5TgaJGQm4R7FEb3CZT/Fk02hIxDgdP/pohVc+xlFX7MK3DXlhpn1v/yVXkM0J7KNnay
         wpvP6YySoPfVQpBWP3u0k3DU9b5ItrTpWPf+zn/lFVdn7HBz9hqPo2zNzuXetITK6eZt
         IqxK61ewdLzgNznk5bQU24j2pWOP6TYASM6cU2X/rI+IpN5dFy1YqnKrI1C30U3KLamG
         4ORBgTJQJGoVY6E0UG70VWGGOi8CMHGso8IGJHg8vA6w3icQZPHL+q8lWEPyGUR6/vO0
         bLjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795576057; x=1796180857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epUJ8mBvT7a5Ze18NVgi9Ga1RB7+0+kQi2Dgv5VVR6c=;
        b=J6s5p04JcXvuG1U494gcQtz8fn887Up9IMXIRRaeQo8zYy/P74xzcvXM+YFYPc4u1/
         tIJJ9CMw9kUOyTZqjpVK2Cn7cREy2AQSVXc9XDuMrGa63NosjhdMlfIUA1UqruSLIFcH
         j1vmki1PzmJnjTgiOqlr22v+T+Aqb8cgTlMsiXIEdRGN4I41Okd+lIENklVzt2NWQHbH
         1r6FKHGfxcGfXaQ0cEAr7A6v/MJYTHokjT2rlDsKeWNaw/h+TIaulEiDWmxRfhhD2KOt
         vXTiDBgnwcC2GhZB3Z8oEQBRA2i5xR2t2f6ZysVOKqUWmLYG9nfBbliBzeG+TNHMspvD
         M8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795576057; x=1796180857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=epUJ8mBvT7a5Ze18NVgi9Ga1RB7+0+kQi2Dgv5VVR6c=;
        b=wrhwPX7qWczGVl1YAkXbgKgDwcbyhTNTFigGlgYEYpYzeiYo03SxYDgA6YjC2xD9TO
         t/7jBL+pDwrafsRsrT0b96kmvx5yg+mvczup//dHbafsWQt4KOERDTK5oQq8khM+AttB
         u0Jo4Sp5rWwG/rt/+2DT6xxyyBHJ0Kb1QEQTeFC09eTCxtq37Rz116zrRu8zV0+0iidi
         qcE6oQG9ASvtqAs4mWtqKLZ4/fEapibIWdxwQ38FIVFixUPz5HLUofOK+VS70sJqefPq
         fKYLhZKoq/xh8f3Oab/SUiWHzjdykIVwflDTqo955Ow0LndWilq2u/cCp8wrpLWh6u0o
         ZKLg==
X-Gm-Message-State: APuU4Z9pAdzGrpVg2r8VOPVKP9wLTL4zmTl2pXAOnN6sc9vsVR8q3tWP
	EGJdT2e2n3Oun2Gqe28qZu6jFJ/bGUot+17VioKc5xiAqTmlgyEpBMf81jWNfucb+W72+VXSh7I
	OfaYJdY4zyCg1svxiAGhZX3XaWxhxWy4=
X-Gm-Gg: AZFdTZfWySlvJNpgR7YSqGPnexKq4FJ+Xbt1sCWxyL7lNRlN7j3zUVNPk+FTduTKGZk
	yt668r92cLVzdhAOH7pNnqbyKJ0KqVjqL/GIpg4OhesXxFxpWIC4dNQ2R0bwjbjEdPkoFHRS/4U
	OcDxssVCusuwMjMypvkun3kmXyS/cw0W7g+rT8WORd8EtisQrsXmgx8hPv7c5O8fpzJHRkJvMXV
	yKqvXBgm4bG+U69k6m3lOHCAKodhyeWqGuuC/BgnbKRs2f6+z6FyCrNJyhZqFjTRTncK8rjIgcj
	heIdqe619AUJTQ/tF2K9G8pEwtRhGnOa4gQYUXiK4+mDbuA6uzeHT+uqydlwdF/7afDsNx2DNv8
	tXcToZTRcbLSTwTgHV0XhBHBQlIxzQzcbB80KQivapljHHU6AP2mnIXgNaVQOWHSl9rZNkEj0t/
	g2Jp6ilvPRHCNlJif/k5tntbyjJ+3i3cc3ZvlZsffSNYs6EkG3DwFpce42RYkjgOAZE1B65FRRA
	lSMqUzyaSHBKMg=
X-Received: by 2002:a17:907:3e89:b0:c51:3bfa:8d3b with SMTP id
 a640c23a62f3a-c513bfa8f32mr1386145966b.37.1795576057470; Tue, 24 Nov 2026
 19:07:37 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124060139.3393511-1-dave.seddon.ca@gmail.com>
 <20261124165329.4dc7e4e7@phoenix.local> <CANypexRfRG1b8eXG+g9bnuzkaqV=8kPmnNO2uVT3+fB_UxCfNg@mail.gmail.com>
In-Reply-To: <CANypexRfRG1b8eXG+g9bnuzkaqV=8kPmnNO2uVT3+fB_UxCfNg@mail.gmail.com>
From: dave seddon <dave.seddon.ca@gmail.com>
Date: Tue, 24 Nov 2026 19:07:26 -0800
X-Gm-Features: Aa3M54pzHJAjHQDsmjOn4VDkYPmLWn6k3XyMWHyryegNM5dz_cYFAgB3RcjXfGs
Message-ID: <CANypexRDsCpTadRiW2f-cPyZ2G1N0x8ubS59-_9VfBSe8zj+LA@mail.gmail.com>
Subject: Re: [PATCH iproute2] ip xfrm: copy only the mark payload in deleteall
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>
Content-Type: text/plain; charset="UTF-8"

G'day Stephen,

A bit more context on "quite a few more", so it doesn't come as a
surprise.

I've been porting parts of ip and tc to Go. To check the port, I run
iproute2 commands in a namespace and capture the netlink traffic with
nlmon, so I now have a fairly large set of pcaps covering many
iproute2/kernel interactions. Comparing the port against those
captures, request by request and output line by output line, is what
shakes out the small differences, and some of them turn out to be nits
in iproute2 rather than in my port.

Roughly, I have a few dozen more like the ones already posted. Most are
small parsing and printing issues, each a line or two to fix, with a
few crashes on unusual input among them. Nothing I'd call urgent.

How would you like to receive them? I can keep sending single small
patches a few at a time, or group them into short series per area (tc,
xfrm, tipc, ...), whichever is easier for you to review. I'm also happy
to go at whatever pace suits.

If the captures would be useful to anyone else, for testing or
otherwise, I'm glad to share them.

Thanks,
Dave
