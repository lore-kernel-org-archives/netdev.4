Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795356408;
	b=MrT8dQYOfu0gIBm4M1HuRkKs1nDzqC73sgffqJZCmM7l5RkMx5Ck4Da1OnSi0aLkxVVv
	 1nsXTha9ZWebAhs03H/vhaM1SoIJgtGLXPqySUlONwStK8ewhHqvitZtTylzg93W+nON9
	 gqiRTWmTuLMxhAozGYwmHCN9An9EW3SE+ZJuNAz/D+Q14cEsvQsTcXKQbtPmrrWceaUgM
	 ZldEfEmJyWQ/BvuQSrv8BwOGPdU4VL/Ew4WjbFoG634AjtggPAunDJoVdlcpdKEbcFAUX
	 Yoa8nJznUMnji5AMLe0w8GZeWX4ZFlzNpwhuoo+Jw50+eoPuslcqXSoNohX4/PG34jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
	b=BS3UHVXWMj4K6V/Y7hSf8jKxqMj35lxbJZG7762882xGMgnVUYNDZm5+taYrwvMt+dVz
	 Il4+8jqejxTd21WF2X1nAzxX/I6eK+vlhMAFX4Zhs1Z5IItcQ0OMwXo3vrbsK68UWGtiO
	 yFtahRyZZoqNj91PMbyTWhRmxfsQ+kfVwYaGZfkYljhaY/eTDJaU3fp1mFdekaEIp3xJN
	 FVmvgTyz7SsveuP7PmFD72GQHzIlOozGD+xTjXhCnoMbK0jQ7vjMS6kks3darr1C7mgLz
	 3vngb1jsE69LNHtFdt6Vyl33waxzd8JavNJMlVgLphzEoxAQLj+Pum97PE2LkQu9uTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jd6ioXn8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936BC606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936BC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jd6ioXn8
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8c60e0d39so2966550a12.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795356402; cv=none;
        d=google.com; s=arc-20260327;
        b=LXGvk8aF/cR4afxpcscI5S0znuu/b9VoQ8+xUG8VolRPsUCvYknNUFaoB+U0XyQ1Sk
         Yvnugi/po84fSlW8M41/aizB5DBORWD6Qeub7BM6S3kGs61TLbmftdvZlW4qybHQLtu+
         L9y+/pkKYMhCuf4DVqtTwz90tnYP5TK+gdrz667Jc9KuPcaoD1p6yhN6tU65d/8gyP26
         T4NF2KMTJKkb6lwouJd8fMMA0wZ7cz8jGQcaF2zks7bYny4os9SSwaZaOx94EcM4XQP5
         crOxhRAh0Xpn6WKzW6RvyDM80IQaZJf3N0+sLUbNIictiymqIuJnxfIj2LFUK2JRwCyc
         sZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
        fh=KI8VRiAwi45X6u19VeS7uiD14bTWYtbb4zvlGRdtUt0=;
        b=kXqYL6qCL3FEFc3dDeFlMZw7rXuppJs7iGo//ych3Qzh2PhMDwobfVlAYsnAuGzMe2
         Z3hPWsR1+adtUpTzpdmmGC4Ptb9HutEt0ZhNKy2p1n67lWTfD1vTT6yjo2y144rvwWBw
         bUQbZ+jZxDyIpY3fh0quI9PI1f8HtF9SV4Q/oSQAfnwCCWbYduijVRR+wwTHNS11cUtI
         BGxoR4INPbWUqY2zJOCvmL7piJkoXuCRHCHafr8zGOKqlGmdCVJB76xEzDvfW0qlWWsT
         /mnEs0l7bU4DkLtzFrHvCDeZDxZ6KrIlq9/Sh2hhQvbYR7vZ0ZrpdjBolDEUM9ecv/qg
         2qZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795356402; x=1795961202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
        b=jd6ioXn8/jtSW042HF6KtWbUIW3aLVlunRvtvFxC7uBtabqLQOB56p7GCu61HgF+jL
         4ERHRbTjMX6muoegMifIFXfcQpMaYLcR9pm4TCKCc9aC1Ms59nBdWl4/K4XAtvpmeVvU
         7vZ2oZxiLbMOCF+o/7WrDrg7xXGtpTH1ohREQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795356402; x=1795961202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
        b=C6r244cfN3nZoE08sk2kO9o75oZ4gc250IljQnCJN9mJ76vn6a3TzbPm92W2dVMfUB
         S/90vDvmFVamIqi+NQwfC9E3MzpHVygg4QETbN5cYzTe91BLVO3h0Ei5rV/YjZEhF4E2
         bAsjia6QUtYaGZQk1szEWrl1mEOSgYFoI/dpItL5ri6fBxGfA4584Ox3vXwdH7AUn6QL
         sLox+iBLx+apAI+MfaUS0djdlr0WBgHSrXtirmJLkz/lG99g7n0WVrz3rMo/BdWJbwnp
         MjrBxZEWi863bQmqHKO9fVCoEN7N77G6Rb2RtPOop/Cvg2Nh+uVa8CU42jypX/snnkC0
         63sQ==
X-Forwarded-Encrypted: i=1; AL+hErHPpwHdTrOM5tKgq8SB0RKQ2W+cz5NPvdCk9D8aEUqiBYI62eUiqbn8GDCDX0zUEAM2lgaHbDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zojO3gD7pHYBu08vnACkZEbvykeX51p6PiSUEGPUOx+dglIi4
	FnV6OfnMbG23YAp7TLA1+GToppjrNbRBkDIAI+c9OJmELKFNGsxSa7/9PqL3mvVpFIwvYbpFO6Z
	MiN/we1jmV1LqbrYPQ99oUNAJr2Qv0Zzb2gRamOdcape1raN2/jmCrHffcw==
X-Gm-Gg: AZFdTZcGui9Jx35koCHY72YH8CBbv4grlF00hHva8fTm7S6O0DVVe4RyAKtaTX/GXS8
	qHKJ9D//ShJPoC9rSrdp72+56IN8WeSv1RCid5C4JxaBLVCSb9xwyG5o4hmSDpKyC7hCVldp61S
	fV/7AXfagHYlDb36oakynspzvOpnKx9NlTWvy36UhGviW8b4tN8GEovk8nCu5E7UL6KHipbAHCW
	effHZo+sKt5xSZBCZ4z9vvQZtm4pJGhI2OGXzIGrspwrVylW5wxeWLG9aABZbD75XjtJiCmck4/
	keSST4r5N6RMMFZJqAKTWzddehhyXPyCngP2QAGXU0hkW7iXE3ZUHLenwxIpRA9rX5J1f0NmYXF
	L186GECjVcyjo70mLcf2cRBimOLWV3rntjt94qheULUMM0TWaK4YtiiuF8h7XEHO58RAIR5TFPQ
	8FL+Rtv/JyLr/xugbabdfj6qUkk8LUdoD8/Ohw39+axG8KlIDm9ZK2iFI=
X-Received: by 2002:a05:6402:274d:b0:6ba:92c3:fef7 with SMTP id
 4fb4d7f45d1cf-6ba92c4088cmr1355074a12.19.1795356402046; Sun, 22 Nov 2026
 06:06:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122042120.2430434-1-piyus@iiitd.ac.in> <awLwiDzVpdJOr6BZ@linux.alibaba.com>
In-Reply-To: <awLwiDzVpdJOr6BZ@linux.alibaba.com>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Sun, 22 Nov 2026 19:36:31 +0530
X-Gm-Features: Aa3M54pNcRlGq48LgyU0hvUMf93COD0ltrBkDDB650T83qW9BEt14_13yQ0gDU8
Message-ID: <CADq=QSyGfZBpziK7r6KD8mm1_0LRO4r4tAKe8gU52Fm-V+DHsQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net/smc: validate the peer's CDC cursors against
 our own buffers
To: dust.li@linux.alibaba.com
Cc: alibuda@linux.alibaba.com, Sidraya Jayagond <sidraya@linux.ibm.com>, 
	Mahanta Jambigi <mjambigi@linux.ibm.com>, netdev@vger.kernel.org, 
	Tony Lu <tonylu@linux.alibaba.com>, Wen Gu <guwen@linux.alibaba.com>, 
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dust,

Thanks for pointing this out. I checked that Bryam's patch indeed
fixes the same issue. Please drop this patch.

Best,
Piyus


On Sun, Nov 22, 2026 at 7:09=E2=80=AFPM Dust Li <dust.li@linux.alibaba.com>=
 wrote:
>
> On 2026-11-22 09:51:20, Piyus Kedia wrote:
> >A peer's CDC message carries two cursors that are offsets into buffers
> >described on this side: the producer cursor counts the bytes the peer ha=
s
> >written into the RMB we published to it, and the consumer cursor the byt=
es
> >it has taken from the RMB it published to us.  Neither is checked, on ei=
ther
> >transport.
> >
> >smcr_cdc_msg_to_host() and smcd_cdc_msg_to_host() copy both into the
> >connection as they arrive, and every later user treats them as trustwort=
hy:
> >
> > - smc_cdc_msg_recv_action() adds the producer difference to
> >   conn->bytes_to_rcv under a comment asserting
> >   "guarantee 0 <=3D bytes_to_rcv <=3D rmb_desc->len", which nothing enf=
orces;
> > - smc_cdc_handle_urg_data_arrival() reads
> >   *(base + conn->urg_curs.count - 1), an unbounded index into the RMB;
> > - smc_rx_recvmsg() clamps only the first of its two ring chunks
> >   (rmb_desc->len - cons.count) and uses the remainder unclamped for the
> >   second, so bytes_to_rcv becomes a copy length;
> > - smc_rx_splice() walks PAGE_ALIGN(len + offset) / PAGE_SIZE pages call=
ing
> >   vmalloc_to_page() without checking the result, and get_page() then
> >   dereferences NULL once the walk passes the end of the RMB.
>
> I think Bryam's patch is solving the same problem here:
> https://lore.kernel.org/netdev/20261112-b4-disp-0287c16e-v9-0-e5e8fa68817=
7@proton.me
>
> Best regards,
> Dust
>
