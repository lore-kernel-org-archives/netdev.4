Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081805;
	b=i4hXt/ryIEFaWNAxMuEzmeJspjmlB1P6zpFxxVJ0SpLMr2jHUjKvgKUsviO1/3E+cd9P
	 aCJXGsJjC2s67sshJwOXnTqSLJ0ML9JaKXpVtt6tYLUEYfsNHfOh8Bexa5W37TH1F3AhQ
	 qnxWxsn+2VRNXyuNxCN+uy8M12odj5xwZnHh2jAGLrxR0+jj98qNvgtjCYisB0wjHBXV3
	 aQNsypD31BqDk/FRhR0eJZBt19NxxERSeMmajI4PT0FMgACLkJdl3dGJcKGjapJH5cPy0
	 W5wva5/Ahp+pYZ4iy+GHhqQ7glUYUdHJcOc6GHHkyf1Drx2pqoWgmBYxi9/p3LY3cWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081805;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:X-Clacks-Overhead:
	 MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
	b=KLGHkM2ow9Au8RP8ZPf/PTytGZadoqwL9uLN9KbLx5GDouw5vp4+RMbcRg05KUgH2Ae2
	 rn/m5IYUVoDLD1KaH3Za59iDpUN8n9yq4lH35kO/T4sZHkrKjjV2LYfDQyB08Q9dy4ARC
	 786L9pPB7IJHlmbKKce2jChIGUsMiAT9uNZ+GG/f60YMLYyjCDHh2K1d9xvtgM1OFHifb
	 W+Qzf2UwFPm/FXUmiJAUFm+puCJ4VeatfwHJQmH+PJHJo3agqLQBPIfutDqQmQKPR1yBo
	 DtTd7YeY7R9rjE46FyxwKN3CTHSYkZTYgKNQj34Gf1Ro4btSe28lA3NueqQyD/sdeNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CwARL8GJ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RrswaD4W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D5606A339
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4D5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CwARL8GJ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RrswaD4W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795081804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
	b=CwARL8GJ5RMdjcLpEFyxHJisMeEBXTHt78lj/9zs+nsVPM8jLFt8LroC2zwv/PqOJoqbDs
	46iS7ZQsasumKq+hIPalw0jz/BsMXZvF8TLT3yscX3ZCcLdBE02KdxJyezch8MXIc78BF+
	TyIv0y5Ykp5xAIpJFygnwS8R4dc6m4o=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-mOOKm0GfOwOoS4B2zz9D9Q-1; Thu, 19 Nov 2026 04:50:01 -0500
X-MC-Unique: mOOKm0GfOwOoS4B2zz9D9Q-1
X-Mimecast-MFC-AGG-ID: mOOKm0GfOwOoS4B2zz9D9Q_1795081801
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4f7d6b98eso14059387b3.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795081801; cv=none;
        d=google.com; s=arc-20260327;
        b=AUy3R9LtNr8zC6YQp5de21f+teyjzwr0UYmV+h1T08Ac7Th2SnLOKIU2Yyi00yIlux
         yL2gSyPJj9+uLVB7KPohHik29MkGaH+XLj1YLvTZkXLfoi4rVVjqF3p2dtDstumXeo6b
         4loFWpjFKcAIyFfWGXIYDrcjtrOjMIkvFAdxUjSDMVvRUePppP6XJVbKrhEeVQbXo1EF
         PhX+LUCTvQL2MjgFzJ+22If4rLmSCgCv+KwCkmKoG16qHI24TDowBHhv6TYRINR6zG9/
         JXXMQbKcwE+dvj8UEeTTqVhsjrm8yq4qNPmqeNQxoH/4pEsdYUgKjTDB2ZE5UyPczHuh
         wqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
        fh=460Qb7+yBJWHehsUeW8dAVxLBaQ4dXgtiKeH1HBxleY=;
        b=mhzhWNPfQq7aGQnQW46zVSGGt7poZuFPalKRrDXeUI5QqeYN5BenseyCIFOsGhi1SS
         dPB6mqKh3kTqVSDAC8mVVcT0aUoAM4tJjYUwbc+3pOdoU96Acz0+GRPMI0yorAyYbGKu
         sajfG7u++DfbAKGZQ+UO1SrDGj0B+W4w39kL6qbOyiyyxc4kIExCkN37BGosS8K38BhU
         c/s2VSMn3v5wNf1kfwodeY9QdMQ4vhvJHwO9QKbvi1WRu+UusvDNa8U89rX7qekbotHv
         0XxKdrjq4XB+0AJeBzts+EBQ16aMAM8gWSXJWkXHjcdKqnc36OngBzbqBf5+cXjynjP+
         LEqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795081801; x=1795686601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
        b=RrswaD4W7x040o8p9lVJjelIFGKhxbDADCuCX3f2gcutea5bMpLmU3WXCGuMd92B9t
         D9phfEC//jtwhHAQ1M9ak3Qc7Qa/NulPXwt406tFz7ZYBiS/2AXsNiSpfSLw/tuZ/loG
         uuhPiMcN84o9wT6eCeFDzTcnuviTRxO3x/tsFBf2N2aW9wtMmG2p5QUi+txlOrxohUwT
         gTa1f4xmuTjwKnLfq1GPYYg0Rirtv3C2AFIvju4L9uCRnJNKGOgb5NbRNXNYK0AFnS5A
         9jCZ9w95jlBxtG+09jE+Bt6RgB2Niwx5MB8qy9KNxTaX8VObLokgheZwY3YlpMzuZpvT
         hs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081801; x=1795686601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
        b=2WBIkMB55hpZGqFFD59LkoWv8k9DJbIdqnNeO/g3e6MI6IWj1LGnHxSqxy0IwILc2E
         g6sUeAnZy9e4toilzyt72Xrctq9X8mQOP4fUL5S8BEvajFLbtIyxk/V2N2F9/0Tr63q7
         SXEcW9FEcyq35GwLKC9lEanQcB9z1+MnyYZqF0GkeXTL1Q2TkBSeSgKfsMpRvu0jU6De
         PD/cTgQhBSdwY+uDH/Rt+KOAPawqL3cdTxEvPnT/8Ap5bT++nrfS3JjIVE4jGZlW0zmp
         31xcJbFoR1PVCeVY7S9Cg15yzM6FQ8quyeBpWyDhW2ccxP1JSvDA48rofBgVPeTAtk6D
         c9Gw==
X-Forwarded-Encrypted: i=1; AL+hErE3QNOm0XcQlicogY5pG+GA6DVOOTxcXLN99w5xdH2xCZe/jDA2aEJS+2afmv9Ofs9FfRFzGxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T/OG2Oyt930q91QgbPkn3VPvAGOht876/cjOtLYKLnRdio5Zv
	nhpHH1bcDz6TJLurvRjNi/ooOdYsI721EtDZgjvecqU+267j/iJO9szcbsppF/K4AMPSlFeY51j
	1bFwvQLlP62tUUHGNNDNRJaEBAFisPpkVmBvpSzQOOuAGHCk0+1VgMPP4sB+L8X3fZqUHVYKwhL
	oSZzEeOGiO7JuqpA6sR9OIvuwuSM4GFp+y
X-Gm-Gg: AZFdTZcOqxGKaJrkeTekf9CKa1Gw2cDOEJsZ6P3FQaDbtbEtYF+5VYCcQ+Lb6SlUF9G
	Q8jZ5JTaQuRrR+0xIUgp4MufzxgA1w3uUaUAxdtkTKdzZgDwg0+sGaw8Fm8NKlOzHdHph1j8eb4
	41E4wXEPzj40Vg0pbnWfELD0m9i7wyi2F/S5pzi/EJ5ZLjipBa8jtPKtT+0nbkCtCOGYNnyDay9
	nP1B9qIb++r37M3
X-Received: by 2002:a05:690e:1209:b0:677:d375:13f3 with SMTP id 956f58d0204a3-67dec391b5bmr206039d50.35.1795081801035;
        Thu, 19 Nov 2026 01:50:01 -0800 (PST)
X-Received: by 2002:a05:690e:1209:b0:677:d375:13f3 with SMTP id
 956f58d0204a3-67dec391b5bmr206029d50.35.1795081800552; Thu, 19 Nov 2026
 01:50:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 03:49:58 -0600
From: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
In-Reply-To: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
References: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 03:49:58 -0600
X-Gm-Features: AclHuK_N9nYxCFMP6w8kx9onG0fKDrrh5jvaU2YZIh88M_fMRcLfBkWhV58g10w
Message-ID: <CAPB2EApXULDiMGXMS6qg17NJRyEruybWMfu_d35tjBPdk4ftSQ@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: sch_cake: fix unintended tin override with cake_mq
To: =?UTF-8?Q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>
Cc: cake@lists.bufferbloat.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jonas K=C3=B6ppeler <j.koeppeler@tu-berlin.de> writes:

> CAKE allows overriding the tin selection through skb->priority: if the
> major number of skb->priority matches the qdisc handle, the minor number
> selects the tin. With cake_mq, the per-queue CAKE instances are created
> through qdisc_create_dflt() and never get a handle assigned, so
> sch->handle is 0 for all of them.
>
> For forwarded IPv4 traffic, ip_forward() sets skb->priority from the TOS
> byte via rt_tos2priority() when net.ipv4.ip_forward_update_priority is
> enabled, which is the default. rt_tos2priority() returns 0, 2, 4 or 6,
> all with a major number of 0, which matches the handle of the cake_mq
> children. The minor number is then taken as a tin override and the DSCP
> mapping is skipped.
>
> With diffserv4 and diffserv8 this puts packets into the wrong tins. For
> example, AF13 (TOS byte 0x38) under diffserv4:
>
>   ip_forward():
>     skb->priority =3D ip_tos2prio[(0x38 & 0x1E) >> 1]
>                   =3D ip_tos2prio[12] =3D TC_PRIO_INTERACTIVE_BULK =3D 4
>   cake_select_tin():
>     TC_H_MAJ(4) =3D=3D 0 =3D=3D sch->handle
>     tin =3D bulk_order[4 - 1] =3D 3                     -> Voice
>
> whereas the DSCP table gives diffserv4[0x38 >> 2] =3D diffserv4[14] =3D 0=
,
> i.e. Best Effort. Likewise, AF21, AF31 and AF41 are demoted from Video
> to Best Effort. diffserv3 happens to be unaffected, because the only
> reachable override (priority 2) agrees with its DSCP table.
>
> Fix this by matching skb->priority against the major number of the
> parent cake_mq qdisc when the instance is part of cake_mq.
>
> Fixes: ebc65a873eff ("net/sched: sch_cake: Add cake_mq qdisc for using ca=
ke on mq devices")
> Signed-off-by: Jonas K=C3=B6ppeler <j.koeppeler@tu-berlin.de>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

