Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455072;
	b=F68yZnw6tuETkM/BQC/05pIBdHQqGbOQan2hA8/mg0qRZNv6OHbJvMxToVcyA6T/mWXp
	 /mS+ZtqBLUslpT513MbaX30PmKhvri2ljPDl/k2hWg2qEZq/FV9Jbl8e3eQatbNY6ClF4
	 yBLSKalRF+mGLPHhByKdKcJZO0XM+4fUxroD8ynRGPIJqv5PlZeYgD+30U2qQXLsmsENh
	 xBiwjSPZYYUlwrh0BvH5svletm3ZzIDFxny8b3GVt+r1IRIfb3CfnP4xVnWeB06JjpAkF
	 kq0ImvY7eBiybYDw0QQjpUfb4GHXIgz9DsbmzVULbKxeSWjyedEmz91ahXCilerDYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=y+D8OFmyLX7UK4acz3h3B9UVbG7v6SV7qrK8+aG7aPA=;
	b=BUgeajKPkzllmPYsLmF1qd1HQO1455wflU1KZpGMktu3NYK1JCnfSTVXJP0Aj6t+DXN0
	 u3/D/lPXBoN7YX9Co3iTrc8NzPEdKA554Om1OEL7WUeoWAz39ATIsE3X4ZvFrQs3uVJ5/
	 vSzG6z/t1y/64sWVxlLXwqWBUSEXIYCJLabzWayCFfRr5Dga8NugzB96Glw2FCDO+RmT5
	 qDC95gaxw7/sXjjHDqrYvlbMRW8c9qXzDhIDbm/ijkdCWn9S2Co0D8cQuJX+fBEww8XSR
	 3jLhebQlRH8pOiCrcojKE2MBFMP9HB7WtbudKJvxpKZivpG+Z33fzO7SEWCrZbGp7qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GT0ZTo/c";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9412E606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9412E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GT0ZTo/c
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so992129eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455072; x=1796059872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+D8OFmyLX7UK4acz3h3B9UVbG7v6SV7qrK8+aG7aPA=;
        b=GT0ZTo/c9mm27zG/D2EP3Jt7qpYnLBo3R4nRVMzoGUfVsZXACnRTCGK6ii5HP/pQP2
         bKQUQROCl4TKIdFx/V/ldX1D2YN/0N1hv49RF7VYz91a/0NUl2XmY9b/oVOYl2XijHn+
         bCxWfpZTFOEhpWNkSCt9KHF/hdHqyx2mgN4GtCGPF6H1F5XXufTzXhFt9oxR+lRvANKo
         joPhmgcitQ5Eb3qDu9ROTl2touyvOIbxxUYMsUNGKgcEXRMw99/yJSmc+Tpco6k07VDU
         cRHH46kGDGpkXmo1+hxif5MqZw4qqSRtw0bnpifUjeiYKBbRsSIwH7Vzs3HRKSj+2QMx
         ng+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455072; x=1796059872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+D8OFmyLX7UK4acz3h3B9UVbG7v6SV7qrK8+aG7aPA=;
        b=keITuKd9eJiXoFC+qQ+2zLMROyQbAc4w2MI/4Z+QxEZDOikYS0dJ/Mgx8ddrgZPdkV
         JMaLuA4lJB2+ql58Z09L/OJClD25IskllXmzfrhjGTsi+QURkoEnVrtOcZDCJlJqkZjv
         z74QOTJ3cB2p8z5dTBCYuoxot66YgAu9NAFomMd15RszHscfxMVvvJzxvTPZA9L18lIT
         ELFhDKTnklgJ6wL2r+RmZcfYPe83ReIkaxajR2eg9RwBcfx5USxa3m3uBlhc8ZpMghtq
         5ckwXP6lzF3KzxhxW0wvub1pzfpJI6SJ+D+f/KCZ+VfCjQ9cdQcpW0X6YZQXvnVr+dX7
         AhXw==
X-Gm-Message-State: APuU4Z+TGQVtuVCb/KmGwSlQWFaV9Dnwsd2ZVOtu9kt2dzRrCnIacccf
	uZG8mfl61c2EWzSPB9eZ5XyD6/jvVKbuIWkn/nOwG3zB1Ja5ntg/kFLO
X-Gm-Gg: AZFdTZftUAP3p1P0Vta9O/Au0InAYSAvoJHo5YhdEI8LPjc+WWYryz37jv69TuMjTHU
	dTJZytHMZeQ3cUU0ssPd30q8++KyPOLfFbdiRcO8aIjzl+J0TpwXPM08Wvl1kI1QtJzeB0QBdKk
	JjoS5r9CE2M85zvAWt77P4PJwg/EMUExJ/huiZ55wTyYP1qEr08/t68VmkSkIl8ybhmXlNDoMAS
	WaS1+EfXVjOj7AumBKcPYWNvFSOT0YPjgpetWiwHo4CVCzYzo4dvJveDzjGR1fFjLa7wwPEUoTJ
	CLF933yCurycjNVHzKs5A1FVgTDdeCw2ibudCrlrQpM7Yivd5mopTNKrVT2NW5P4HKXykTIzaJl
	0WnpcnjGP9oWgofzILK1T6k6gewllZn6IIlG6ZgqyhELS84kkeIcxax7Yq3loISnfOyrRNTuUEf
	8YoM90l6C83nBe3HXgU/875DlTbjHb5KD2dPWGiPGkak5ZcKw5pnZXpgyNrk0Mmcr8KoGvkVMRS
	Y3Z4bFDJBakP4gKnAnqka3nKnAVuJAmVY6GUTT24Wtk9ObEoWW1FZRxaIVZSWH6vpt1uWHKnDiL
	gmFZMJAuu5mNstLO5jgfpSM=
X-Received: by 2002:a05:7300:50c4:b0:386:121c:c275 with SMTP id 5a478bee46e88-386121cc3c8mr11371229eec.10.1795455071507;
        Mon, 23 Nov 2026 09:31:11 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm45498107eec.11.2026.11.23.09.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:31:11 -0800 (PST)
Date: Mon, 23 Nov 2026 09:31:00 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 7/7] net: kunit: test incompatible memory
 provider rejection
Message-ID: <awR4VGZAdBosIeMW@devvm16445.scu0.facebook.com>
References: <20261120201408.3445445-1-almasrymina@google.com>
 <20261120201408.3445445-8-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120201408.3445445-8-almasrymina@google.com>

On 11/20, Mina Almasry wrote:
> Add KUnit subtests in netmem_ref_test_try_coalesce() verifying that:
> 
> - skb_try_coalesce() rejects coalescing two NET_IOV_DMABUF skbs
>   belonging to different bindings, and
> - skb_try_coalesce() rejects coalescing a NET_IOV_DMABUF skb with a
>   NET_IOV_IOURING skb.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
