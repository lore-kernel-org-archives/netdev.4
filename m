Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795176271;
	b=BAqbtAj5mZ8E78e0KUpblFsmwSBoDrPMZOkvezhih8QxItoQrK1GhWGtTkV6uv8Jl/6N
	 gpWoFIr5soMNNe77wYhiSHml0jFAvP3BmIs96Z9ZmBYW2Y0aQAG2AQ8G3aEWfTnXUctBM
	 xfHMqsBcVkdpTiSYaFEzUf34Elw9jWBVoVLetjqBruiJKeNfWUjBTRwomz5AjS1pCZCxA
	 zddpRLSmHDQm2T8KhyRl5KvvSCcGX5TZMPiBV7B6LZtx7ffIpgoZzaWZ7OY3ERhfp1czg
	 VjUCagG8ryIP46jhyHMZeG6Qjb64fspl5t7nAMpfXnYwUJvWWXtDh12JpLVNrgtNfWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176271;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=XQu0hGy1KA1uO4Dt43vnkVWs8fGf8xNR3xdR0Qb+GQo=;
	b=Eb8G7YKHIXLbHbSh38MFPwRd25FMqqdsO0eIEJ16MjvnA5/+zQ2wXM9W/R+NzJ88H+h+
	 XIB9Y4jpdzQMqXWEU7jRkqYrpQsBdw5kSk2Q/HllDbargAhjisNZevd8TlO5t/7tszZhH
	 dgVDjmlHrWG8o38/TVp0poXsDw7daXCI4RoizCCa3jV7k1BgTGFjp/NuUJLW7/MVlfwb1
	 dp0/qjVnkoJWWCKOaePdkTHDkzjV2oX5fIyGdWRJHSHFFymrfXAnljK+o0bqirD2aBFTJ
	 pCwgIa1sgodohaffCsn3WV8f4FEh2+fY1PknbUndOWYpp8dSSb2sodsWMjeqsiL9T9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M3uQpmZf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nxZbC5YZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6964606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6964606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M3uQpmZf;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nxZbC5YZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795176269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQu0hGy1KA1uO4Dt43vnkVWs8fGf8xNR3xdR0Qb+GQo=;
	b=M3uQpmZfqbVJjPN6Ut5ffQ1KdCKMRl+8gJz1myYwkFG1aq0X3VKJEUVBQLP3doPi+DUNx9
	2PX39Dt772bPI5TJ3ToksloECLyXG7+xp/tyBJmpkxe4MCgCA9C87PzUJ9F7cyp5D37Xl4
	2D5/e7fhqHGtwbEwFgIDC3pPnrYT0gk=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-tqOF1-CsMlC7sPoHhDVGew-1; Fri, 20 Nov 2026 12:04:27 +0000
X-MC-Unique: tqOF1-CsMlC7sPoHhDVGew-1
X-Mimecast-MFC-AGG-ID: tqOF1-CsMlC7sPoHhDVGew_1795176267
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677c4ca22c5so1503000d50.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:04:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795176267; cv=none;
        d=google.com; s=arc-20260327;
        b=CXHWlop0bScKd5sfxRIss+ws/cmi6NeMcHxMewIB4HqO/jW+B+aSGKvHW02SGrVmz6
         rlGDAYXJ8HRG5Bgj5lGnzKGV9oKgtT4dpdMzcFrAMliCai2vH3htoJ6UuOUBAj7Yz9lL
         6tv3e1Ds/aK9V90ArFAZOU8HZBDbj+bPPhv0LEiMTvxVGr9BDNg57VNotFScWyqvK3Cu
         MpaDKqbNhe2j24d4aOccROBUU8rAX8d2ckb1t5/c52MRm6zi3YwD+tdcIipVZUUjufTZ
         F5DCKooTj6/VD5TR6t4nnTQfEIQgTnJF9SOgKSvhqyLho8o6mwBSpaT1b+15d6XMPM3/
         nyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XQu0hGy1KA1uO4Dt43vnkVWs8fGf8xNR3xdR0Qb+GQo=;
        fh=fM5IUqwMXj9gDc9PQYjy3NYoafVJjdY62MO3MTgZ9Ow=;
        b=oQFTl1mgSOyDnfC1pS5fxT2hyrxOm87BXctHLlIqWYUaHwYBBhHNqluKZcBi4+fe0a
         XQ00itafmnO4FgCXAqoE/rQXYKj9STnJK4mG4aSVht+/ol0HrXjnG9PKPTaRpwa2Suza
         u3GinX6qGVG5UUfz5GhfFhqbkrFdaDWPGXNSDi8DFmQB+h60d/UjHOElJ9NqEszR08EG
         rP3j6yccy08S7hdDXpiteYW+mytunBaPA0y3l5Ay1exoBb72ohIjnTkaxYPJKfHKD0qD
         LwquVbsv4n+i3eTNRAOIdRdn6Rq7SUKWkHjCWAVhfR9/b4y0HAAh1hlCPe+qH5/BV6Q6
         RLPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795176267; x=1795781067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQu0hGy1KA1uO4Dt43vnkVWs8fGf8xNR3xdR0Qb+GQo=;
        b=nxZbC5YZPCZegBCOvX5RXZwjKOHM2FpbX/qijsdCCMZcrhShfupgktsMIEG4L0klfF
         serIHzmSktODQUIH3r8fukMrSL0LHU0b6zXUR/MVjlMKgEwkfeOqkVS70vfM6FNK88nx
         ejBvkJTRPPtgHvGqo0giJuLDixu/zqKbUDE0eJ7TuYK5q5qo8e0laqgvCAMJF2s0bO20
         Ji1X4aWOm38bQSTrJuEX04mAr2p1CgU/oUw/5sIh45K1Qo0obp6PSHXwcxOr2WoqKpUD
         Y+YyYNi0sVkd2YB1fs4rMRlknFOP46imWMpVB98pmMl6J+oxotUsSMUgzYgVAC2F4HXR
         kxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176267; x=1795781067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQu0hGy1KA1uO4Dt43vnkVWs8fGf8xNR3xdR0Qb+GQo=;
        b=i0T3NDTQczb3EIpIvpHaT84mrR4IIPY8pnXsOjsLjibSPDtwh+CKVBcuEU8NUl5f+n
         fxyhjNJ/xp8RVHtIxTU9qhaxQzvx7JhujLQGdlpIRpa1fIkKjY5ILGaAv6tBCvzcinWo
         sxXBlcKpRBLMWHcr3w8v6gAdax7pBhsRfbYjlzNDEwFp41IYPEIiSx2Focy4jc8M/dtn
         YmI+lqR8WgboSrw8MKUMeBaLhT++nGS4GmoejnPj1lqe6KC08sEN7vXtFzImE+gTFd98
         8uBDjLzROz9b54gkb661WTmCH2w5yTStRCQxQPVjOBaFgWF5WSBGvxFS0IgMckBOchKv
         0lWQ==
X-Forwarded-Encrypted: i=1; AL+hErFPoX/4z6D/1sqPKu07+r5GDvQuovHp/Xy+xSFZkQZ0TdgyvVNNZ/ExRbd3jT5IkKmOaSmAg2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CxH1pc+k45CYyr3fkorW2n5UVvpGBGnprjvhNVuBq1iDZ7HM9
	1V4b7aOWdWJWtt2CiZ5tdGZPueTi0cQII6XIIGMjRhy/dSRugyCyhHhT20MA/ZiBdmOlSh9wX3E
	W6GFVDSnmwLqk9tS2EiVq9ytTWisNn16mvrfMkP3cLLRSrhY2oZOdNO77A0xHQB77bQrKlWnlRa
	rrKVVIHbEZDSS//QmJanUs2Sea/wJFm0cd
X-Gm-Gg: AZFdTZd8kMbgKxJhVOGO/fNwXtrpEiF6+jrIhYeGKWJerNIQ3KFGBoASqgLD9V2PZTW
	7DzPkmwKYrD0S097YKvUGx1+df2CRA7IiRla+kYJzUvLSSTT6o9CZnuIdLgmM3yn/JwFsKHqkn2
	TfU3AiMozTb5Avg8SoNZKNtJti5k8xDroQGVSh61zrAJR6a+wUs6AHVYHm24gQm94Hjw6n1ugx8
	ri5nq+W0Br867ytFG3dT86/Zmca8hvMz+nji1enh5WCIC6XfPpG6AqrSpE=
X-Received: by 2002:a05:690e:4090:b0:67c:69f:b1db with SMTP id 956f58d0204a3-67df43cf48fmr1438610d50.18.1795176266589;
        Fri, 20 Nov 2026 04:04:26 -0800 (PST)
X-Received: by 2002:a05:690e:4090:b0:67c:69f:b1db with SMTP id
 956f58d0204a3-67df43cf48fmr1438589d50.18.1795176265935; Fri, 20 Nov 2026
 04:04:25 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1B3A1B72438119BC+20261120033824.681219-1-raoxu@uniontech.com>
In-Reply-To: <1B3A1B72438119BC+20261120033824.681219-1-raoxu@uniontech.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 20 Nov 2026 13:03:49 +0100
X-Gm-Features: AclHuK-i5EtKvbqYrIjTizPF6lX03AG63KfWC612II-z105w9vnQhBI_r_r_XiY
Message-ID: <CAJaqyWfpkenRAYdkeG2+XEWRhJbmV4ARZ+eMm=EibcA6i0z-5g@mail.gmail.com>
Subject: Re: [PATCH net v2] vhost/net: Fix receive queue test in busy poll
To: raoxu <raoxu@uniontech.com>
Cc: mst@redhat.com, jasowangio@gmail.com, davem@davemloft.net, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:39=E2=80=AFAM raoxu <raoxu@uniontech.com> wrote:
>
> From: Xu Rao <raoxu@uniontech.com>
>
> sock_has_rx_data() returns a positive value when receive data is
> available. For sockets without a peek_len() callback, however, its
> fallback returns skb_queue_empty(), which has the opposite meaning.
>
> An AF_PACKET SOCK_RAW socket is accepted by get_raw_socket() as a
> vhost-net backend, and its socket operations do not provide peek_len().
> With busy polling enabled for this backend, an empty receive queue is
> treated as ready and a nonempty queue as not ready. This can make
> vhost_net_busy_poll() stop polling prematurely or fail to stop for
> queued receive data, and invert its receive-side scheduling decision.
> TUN and TAP backends provide peek_len() and are unaffected.
>
> Negate skb_queue_empty() so the fallback matches the callback and the
> readiness checks in vhost_net_busy_poll().
>
> The issue was found during AI-assisted code review. The helper's
> incorrect result was confirmed on x86_64 running 6.6.0-amd64-desktop
> using a temporary diagnostic module containing the original and fixed
> helpers. An AF_PACKET SOCK_RAW socket, without PACKET_RX_RING, was
> bound to loopback in a private network namespace. Across three cycles
> of sending and receiving a 60-byte frame, the original helper returned
> 1 for an empty queue and 0 for a queued frame. The fixed helper returned
> 0 and 1 respectively, matching socket readability in all nine checks.
> This tests helper copies on real sockets, not the running vhost-net
> busy-poll path; the vhost-net module was not replaced.
>
> The patched drivers/vhost/net.o was also build-tested on the net tree
> with x86_64 GCC 12.3 and W=3D1 under allmodconfig and allyesconfig.
> No end-to-end vhost tests or kernel selftests were run.
>
> Fixes: 1576d9860599 ("tun: switch to use skb array for tx")
> Cc: stable@vger.kernel.org

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
> Changes in v2:
>   - Target net and add the introducing commit's Fixes tag.
>   - Explain the raw packet socket backend and busy-poll decisions.
>   - State the AI-assisted discovery method and document the diagnostic
>     module test, its results and its helper-level coverage.
>   - Document the targeted build tests.
>   - Keep the code change unchanged from v1.
>
> v1: https://lore.kernel.org/virtualization/20261110051642.249640-1-raoxu@=
uniontech.com/
>
> AI assistance: OpenCode was used to inspect the history, prepare and run
> the diagnostic module test, run build checks, and revise this message.
> The code change is unchanged from v1. The discovery method was confirmed
> by the author.
>
>  drivers/vhost/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 4570a4ffbab2..10ed2d55ff07 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -538,7 +538,7 @@ static int sock_has_rx_data(struct socket *sock)
>         if (sock->ops->peek_len)
>                 return sock->ops->peek_len(sock);
>
> -       return skb_queue_empty(&sock->sk->sk_receive_queue);
> +       return !skb_queue_empty(&sock->sk->sk_receive_queue);
>  }
>
>  static void vhost_net_busy_poll_try_queue(struct vhost_net *net,
>
> base-commit: 435cbdaf9b03687498dc16fe4af8d16a977e21d0
> --
> 2.50.1
>

