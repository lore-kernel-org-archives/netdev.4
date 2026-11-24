Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523262;
	b=pkDzHaRxS3jCsksiDbqxBIevKw3jLcO+6pZhS+4TcoO4rbqQJ0nLRXLp8N/xpmhL9UWJ
	 fJXtz3ttjcg+PfQPnM2cEBBKe1xKuqWgwGRj8FtMZj9b5tBy+N7YtG7mydrZOH1D9MxgE
	 gIT+0NLrICcc75FhX4bdZI4WhTkOpMHAvQ12v03v1N49Zhwn7QPV7SlIv76kxLNpMqTiC
	 2+BMHo1ENQ3I9DfQBhAXWt3EwePRP3f+VTXaOXqHEGCezpqtpcnhqn2TB+D5IKJDylhz8
	 I0B528x8In9C4TsR70/j7J5HjQoSUtvLzsP8QiX79EMKS3msZh2c5zmoiAiTo1npB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523262;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=E8RO8EqQMh0qvc/m85F6RGVBo/afRzFDeTmOzmDes9Q=;
	b=DZQCpzwleuUSsmKfquXIopWz8d/1q8I/mq64BPUQqx5obwl8SMmPykeIKFAz5CAhZvRM
	 u//RKi35YWwgGpOMIYQu9pslEcNhqaMDiorNwD2YaTcbGQJLQCM0CunPiX2vggFSpmFPW
	 c1FRZo2i02Zo7+3xdEG7J79dIgL/fHtZuDdA0GyTuunONJVG8FJwrfTbwWWWVfAG4o6XQ
	 Cb5EmlQby5HXHiYksnwj5fI9lDEmIvroq6pJ8GBuwCnCRIyUzCg4GtcJzOIMPf+lAphd+
	 Lx+4Bb/mwsNy40Tl/crAryvPD6Aotm2iCEetTIaM1fVajnQI+X6Th5EwoXa44SwKxtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuHxVSQ7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QV4fRKle;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B863606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B863606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuHxVSQ7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QV4fRKle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795523260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8RO8EqQMh0qvc/m85F6RGVBo/afRzFDeTmOzmDes9Q=;
	b=XuHxVSQ764IKLx9pfke6aZU4bRSpm233o+vseMLoqEUCKeKKDBXbDt4b2WffyvD3FukXrR
	yQWiXpVque1x8iwUptiA/9DHA8CvTxY3HRR1oC/7wnN01dJMsgRQsAbKMwu6uDPvKFcDQy
	VR84WQoHevQK3MYnqGyLcIKQag1cvR0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-I6vDnn4oNbStz2b5vtmHhw-1; Tue, 24 Nov 2026 12:27:38 +0000
X-MC-Unique: I6vDnn4oNbStz2b5vtmHhw-1
X-Mimecast-MFC-AGG-ID: I6vDnn4oNbStz2b5vtmHhw_1795523257
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso23285495e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795523257; x=1796128057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8RO8EqQMh0qvc/m85F6RGVBo/afRzFDeTmOzmDes9Q=;
        b=QV4fRKle0a5sJ0R/NDQYJEq5LXtCDUBlm5zU0okwE/zup2lwZXav7vDULqXTIyjKoL
         /S+5RElZ8CyTl2w3xcYLcIT5nCjDi/74qebPz2OrbXXpLLG0hMgVLv3zBf3MOgnRnxPm
         uvY/IY5bQy+9OTD4dQSAGCGcsFuqfyUvFk3EpTTcrq8z7qyS0N3EYaryPrZwUIOdZwNa
         WCoiR5ANTsge4CeHUkY6hRBZDZZFYc7lWWnRQK4W6ECOAVsT/5Stbjhi/A9ZrWtOM9Nn
         wXI9VUYwqmKwh2/fLhtFKFLeDjFDp8YGzxbof0cF3G0cW6TPIxwi2kXU+vUc34ZjA0vq
         7Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523257; x=1796128057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8RO8EqQMh0qvc/m85F6RGVBo/afRzFDeTmOzmDes9Q=;
        b=CrqTNUzMOC37QTxcWBNymRk6ppuASlhrWiovh20lVv3ZMBtL/KD2yOcr7+hf7pj2SL
         pTHOzPH8WQv5BKDBvmfuFqhru0UtVp/th88j7DnDtLOzq/DWx6SzaVXSmi0hnx9pZt0t
         t9XfGDNIyQy81Dao7CBDsiBVgDWAurFkSXE7N0HTxEcJ3XdYLnj9DBgOTiCIa9ucuVwt
         B5fmTJemzDH//kS1J2a1RK3dnwT4i/bbCElctFygr7+d7mGwi1Xto93fqczX+Sly88Su
         8/mOjuSGXL/LOAvLi1uWchKbaQepEkeoZ7FIiCt6aR/EFVxOMWftUKTHcDCq0lNPeADH
         uAJg==
X-Forwarded-Encrypted: i=1; AL+hErHnLU0846e9h0pTbTS8AEsAJ8hqgOhBVVn4kpMXCIWqhhvQJDibXfmAoJ7oDlM4jSAKTzMXjf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D+JSMY7Ao8GLdXVqJCJMSpUdkDStWwQMdz/y62wp9esleVGiM
	AzzB3TQEfwb+nMfm52vfI2Fm4xf3uLpdvl+4HaNOiOWbpawYh17ZmXwlbVL1MzFQAkGbc7zoQ/y
	s1uLEmXzKWr1LtaswFxMOaOMBnRZeq0N/8f+JeoOvdYCIDLJWGvPMtPxkKw==
X-Gm-Gg: AZFdTZeZygsGZhIXnQr/4vvRBZ37QmH1Bn7TnG43IBkI5MH+n4e1FYaIRKEOyqUdvTL
	CASwHGxFj/xRjQPJl5hzjxVPI6QCMbKNWRooKJcMaWQWRuVs6bseYWlNEe4VfDy2G7zo+flUHca
	saEqWSxkWMMbkQowknOAJ8B1Qm5ggs/+pe1T6Qt/R/cdNd63qPjABcDnOiahuMgQ+cpi3QwJJdg
	t4cQzc6IMG/tu5WBz+IEBjJr+T+H+hNSstjUpQUBj08Z43ejh99VXYhtfMDP02kmky73D9kcR70
	YG6+fR029CifSG6HOoY5GIPiPNI25NACQK0Mf0iqPWVqmcKx1QDz1bGpab6wF1x2hzBGcxbMNnE
	bUFJVlpEcOxYNFYDY5pbHuMOqc2vavTEb85M2p7fO1XyrxE7jhnwIaNCziAJpdQVg0uZPFqtRWT
	mxecwbdP2LyYxEXZ3mnyDLGifZS+Qoz2FR4RfvF3/YU+xS
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr312098865e9.35.1795523257021;
        Tue, 24 Nov 2026 04:27:37 -0800 (PST)
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr312098305e9.35.1795523256610;
        Tue, 24 Nov 2026 04:27:36 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm510138135e9.11.2026.11.24.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:27:36 -0800 (PST)
Message-ID: <8e69f35e-73fb-4558-910b-45f5e723c64a@redhat.com>
Date: Tue, 24 Nov 2026 13:27:35 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next,v2 00/15] Netfilter updates for net-next
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-devel@vger.kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, kuba@kernel.org,
 edumazet@kernel.org, horms@kernel.org, fw@strlen.de, ja@ssi.bg
References: <20261123135726.3940688-1-pablo@netfilter.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123135726.3940688-1-pablo@netfilter.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 14:57, Pablo Neira Ayuso wrote:
> v2: address cover letter errata.
> 
> -o-
> 
> Hi,
> 
> The following batch contains Netfilter updates for net-next. This is
> composed of four groups:
> 
> 1) Patch 1 addresses a race in the nf_conntrack_buckets sysctl handler,
>     that has been reported by LLM. From Fernando F. Mancera.
> 
> 2) Patches from 2 to 7: This is a conntrack hardening series to address
>     LLM reports of the issues related to skbuff mangling while a ct is
>     already present, leading to mismatch protocol numbers, ie. ct becomes
>     stale since it does not represent this skbuff. This is unlikely to
>     happen in a real world. From Florian Westphal.
> 
> 3) Patch 8 updates nft_synproxy to address SYN and ACK packets only, just
>     like ip{6}t_SYNPROXY does. From Fernando F. Mancera.
> 
> 4) Patch 9 validate hook priority so nft_ct template is narrowed down
>     to be used where it makes sense. From Florian Westphal.
> 
> 5) The ipset hash types conversion to rhashtable, including a new
>     rhashtable helper function to flush and destroy the hashtable.
>     This is a rework that aims at fixing the existing resize races in
>     the ipset hash type, which has triggered a myriad of LLM patches
>     addressing the symptoms but not the core issue. This large so
>     we prefer net-next for these series. Series from Florian Westphal,
>     plus one patch for rhashtable to add a flush and destroy helper
>     function by Herbert Xu.
> 
> Please, pull these changes from:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git nf-next-26-11-23
> 
Unfortunately a couple of in-flight nf patches prevent the CI from
picking this series:

https://lore.kernel.org/all/20261120111910.67379-1-juny24602@gmail.com/
https://lore.kernel.org/all/20261121212037.149722-1-omermetekaya0@gmail.com/

Could you please re-post it? thanks!

(Do I recall correctly that guidance for nf patches is to not CC netdev?)

/P

