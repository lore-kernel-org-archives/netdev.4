Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795345040;
	b=xWmmjh2t4liC6S9d6EfzbbxxVVgOapxDTrtzlBBYQPd/Do4Q5TibWSzRuSvPj7Pi9JE1
	 NVzwwVXpuJw7nyb0IWZMCMhMa8ksFaP2KjImXicsRO4Tox+RVTvNZNVULkLAW5SGCgDpM
	 1BEQXZNyrsKmVHSgpHMMMr2GAckngsvPrQGDfbsxqJfXa3VgGfb4CNG9JBIrnNjngGCr9
	 PIlZsWdJgu/7KQ6SHQ8/U8ux+nUN/Qr1aRiVpVCdyYFCU1rpqETALKBMfMyjIXPFG9/L8
	 SK1cUrPGxTMTqm2rRAPxZyMpsGHHHhdC0+RkT8JCTaif3lhHx3ah+ETsmAKFMpPWDFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BNasIbMPw7uRY1b0KwE9qAOAb9RCCZLairGlbVLIO8k=;
	b=jRKJvU75lqvSXchKyGM386kf2rnzS0K2OnOj4ShBJ6zTiaQw9mRIXdmJ45GTiXLn2tk4
	 6mHjgEDQ5fk3K7TBUszLP1bEaFjPBLWDVHsbD3gN68CFjpOU6EgGqBCg1BNcz1pMIVBGZ
	 Rf0psZLvRumY778geshBHpeQ7LS8cMIyBkAVDHaT+sFPQl6+utMgRwoVdvGUpLnv3EBJh
	 F24KA9UquKyBBAxmCsRjFGgjD0SDj6d15by4Bbt90Q86aSSq1LdhY/2aP/2y4dStFjdA5
	 EgUAcUQX5HZN+K+H6grbIodK4U6ptA2WlCN8aMG5rKpTT6/JW9GhIsq3w7Rh97w6BCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=G2B0zjTU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C069606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 10:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C069606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=G2B0zjTU
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so1000142a12.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 02:57:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795345039; cv=none;
        d=google.com; s=arc-20260327;
        b=LO3oO4J206M17uhUCrjSwuUN4Tfx0NIhiNhYKownRxSjFEEtTSOmSVhr8ZQp8pguD0
         0P3sk64BsOIH52Hw7oXApwkIMWqVhYGldEkA0FfIq/Lp0KDHmYzwElz8EMubWNYiFgmU
         qyUR5lR0lVG6syATyzKHtLu1lRhKMSpE1AUQTU21b4qlc8G17fCUno6PTAhO4SU21VHv
         /vOaCr/eTfQ856C4am99HdsjzcGpEz5hFGQcElNOMyh8HT8aAjH7/3rZs69H9nPxoxi+
         kN/ROCJP0eTNfgUWvxHErKgIfnW/m18CYIo7MnbjhC7eRFwk5f+xg8pgixn1yPJ44q6e
         +GsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNasIbMPw7uRY1b0KwE9qAOAb9RCCZLairGlbVLIO8k=;
        fh=bmEQ5tWFJj4+MSR0NGjOGLcHosl7ENLjMRIR+kSWkH0=;
        b=pUicBkNyKLaKqJIYTTkQO1NZ2SUgArMCxIqH09hTZDCgpX+92TxX44/IbXX3kSOq2z
         sw8UJPb1Ft6A87deC0sdiC+JHaQ+AVdiNI4rzhPVhbzcXUEWgm9BVR917IXX+YMbsuOZ
         MG/UPBjTFCzLosjgxdgaEYgUvXvrXRUrrgGsBkEguCLxl1Rvqoh4jYb4ImRDk+8fEYrq
         NLjupkE/vTXY9JErTsL9vn9bJv+6k96NIVzkFcGnyY2sbpCBiYeHBFS+1l9cKTaH67Fy
         rj9M8S0IUnhpRKm7+E1Q/+JVaDagWk2Sasl4wsVFMV6k3PDbkK+82cym72K/t9XzfQWm
         naTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795345039; x=1795949839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNasIbMPw7uRY1b0KwE9qAOAb9RCCZLairGlbVLIO8k=;
        b=G2B0zjTU8lBJS6CKQaytWzmrG9bwnwkj2QU6i7Sekl3FJiVvTEA8ed2qzInBrd8DLO
         a40+SNA+ei81mz/oELEoZsnXjRhCfMB6d3AOI0bqBoWe9DfXz4v/TF6t083/y+O94zNl
         IBzx4Mjsdn320inANqsu0/4AdxlqFDKl5lE58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795345039; x=1795949839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNasIbMPw7uRY1b0KwE9qAOAb9RCCZLairGlbVLIO8k=;
        b=j+VS/7Ecd2cQLF6x/CvtoCAMqmjW9DXeqqHngwg1Ym5KDoQki0VwLmsuDceplPuQgP
         rg6cWYxLWnezoE6hcGFUwNpIkRAwOcu4q4nkhU73E6O9sdn/DlAFv26El1ChS8y+cRNJ
         pIGL3JOYcU0HOTRRSYGc3+cwONa/X/s5ruJ5AR85NN5XSd/6Ou8aWhSMEDim/0Z5Vw1k
         mt2H2L/nS1cATOqEh7Ft1tl4aKr4/c4VNGk0w6L+O4vgOD6e7IWqo02tAWVVll0R3p3l
         Midm4f1TADxBBAwlONhd0988mXYteFWWqLUEvhJdphm1vrlRIf2+NbzGBx1WOOknK9I1
         DPOw==
X-Forwarded-Encrypted: i=1; AL+hErG+19X8k37byPwB3zLfUX2FWokYTyMsGF8Z90yIIPsyYKhIG0Z85Pg6LpdnoKMAIWNKU+0xxIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kYjgNjbHuWafFZu0c4vB06AECwmB5F5YtHn7sU6FYzb4mPjCx
	wPkiV8g05mo6o+WrepQbbwwp0j4ylSXaPu3dAWGHNi6yFhl+6o0zfTrlibot6xKNW5wS5uczowm
	w7CdkU7GuwQoBTBdWRMTpvP0duSNxqkVtL9Qhad4j
X-Gm-Gg: AZFdTZeIAIRblkuxnx0w2wq8dpb9Qa8LAhlXEOQIzbFT6qLgEjg1nrC7MqwE44ktE5s
	IOXJXnXPJG5AHpps6Xcq4SdYUjHfuDXIkXXIf80R+ylsR4nr00Pc93gcExtmo4VSPG4RLssJ7zL
	w+iXG66yCzvJDHBmRJ8unu37VdhDBCPbqlNeoPPw2asPeaBh0QRzJzb44FyfVFrSPn8bvclg1Ap
	dvaBiLISott9gxhp/qk0+s4R49ikrsZXxoPVM+IS4obJ7Z2LK5imIGP8TNaDQY1nEY/t1ae4umh
	2PMWPX60bwmd/PY96e/J5jAhJsbH6ryy3M8NvNw7uGoFX9+sCisYOxadr1nrZvciiK7BgfSGg75
	3fYwFPokgn+4ac5WoRvIk/0+r0w9e/oSD0th2M+h/96nSTaTJh9lXc+iksGSWDj4To4EbeyUPef
	kiQdFFlnZcf9eQl8cLctaJ4O7JHG95g+KFm/p/vU6SoA==
X-Received: by 2002:a05:6300:2201:b0:3eb:b9e1:4341 with SMTP id
 adf61e73a8af0-4014ed57644mr8290036637.67.1795345039307; Sun, 22 Nov 2026
 02:57:19 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
 <20261117141653.60ce5d92@phoenix.local> <CAM0EoMm5jkHBnkdxKq_TDs9uwBWiJSqrJLXc_CWOOoT+_+X6mw@mail.gmail.com>
 <20261121155028.44552d14@kernel.org>
In-Reply-To: <20261121155028.44552d14@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 22 Nov 2026 05:57:07 -0500
X-Gm-Features: Aa3M54q_ek8ysfG8YPArTAaX0mdaCYHegvEq0V07Irx3OFIZ10poln0dCdYDqMM
Message-ID: <CAM0EoMm5sOA-7sXCgF4mQ-TUM+yvMA0ZbeHo5Ad_zXHHL5nQGg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stephen Hemminger <stephen@networkplumber.org>, Victor Nogueira <victor@mojatatu.com>, 
	netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 6:50=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 17 Nov 2026 17:54:28 -0500 Jamal Hadi Salim wrote:
> > What is the problem? This is the standard format sashiko likes:
> > 1) you describe how you came across the problem,
> > 2) you describe what the issue being resolved is
> > 3) you describe what the fix is
> > 4) you provide any extra context
> > 5) you describe what the conditions are to recreate the issue.
> >
> > If you leave any of those you will end up in version 5 in no time. In
> > fact you will immediately get a note from Jakub's bot to ask you to
> > explain #1
> > Where do you see the sumarization/shortening happening?
>
> Fun fact, if maintainers read all the commit messages for patches
> coming it, and it would take them 2 minutes to go thru this slop
> we'd spend 8 hours a day just reading this garbage.
>
> How is it not reasonable to expect the submitter to look over
> the commit msg and trim it.

The problem is that the sashikos  review it before a human reviewer looks a=
t it.
About 30-40% of respins relate to prose in the commit logs or comments
in the code.
If you don't provide "enough detail", it complains. If you miss a
double space after a semi-colon, it complains. etc.
There's a balance somewhere because the more you say the more it asks for.
So this verbosity is not to appease humans; rather, it's for the bots.
Since 3 humans have now found issue with this, we'll experiment with
reduced verbosity that still answers those 5 questions and see where
that leads.

cheers,
jamal
