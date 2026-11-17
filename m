Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917802;
	b=PibHYmNVmxc+S+v1tHBJ9JqJZVoNQQIkxW20QCf9Cewe5oBkosCEK8b4RorzNUfqRtda
	 S6wpHkKFTc2R9b8+3n3HDvNZm9qiG6lol4JfRRSveXRr0gkhp4YV0qZMWQvyqmPDjapWd
	 2B/QrsViOwy2yJ7jGyO4ac24q6FZKW0skO9RUt8XfErJk9Q4tIJbGhkYz4fP7zD6CHHWR
	 lQWEn+0aJw1yQzKeEerR+0hUAxZpFOSNUIbB0cGzrZ5XyzZ8kDMjLet9beA8QzEx4iz9b
	 MNFDoxS+MOlsG+RWH240RKFx7SRKieacN4UYJUwB8zIO0KHp7MSQWVw0JdzntCSw+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917802;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
	b=UF2xZekrs+JcgwUFvYB79+SqDBdEjsU4+5cFR5uW0huB3ck9TzZB4JxHkNzKIRw3ofFL
	 oGxASsOsX4/1pi4SAkV6/8NQDa8kINa/3GWy4+y80xOBh8c4c0/5Zw6Ebew2Lu9Ai/qJz
	 TQbTz+s+uIPclfXrPAvCXkpEoZhHpkZ6VjcXhZjF3Px90zk1e+wcuvfoNr/0L4c7jvv0L
	 Bs/dAm8JHp4yvEEXadOdNi2QGX8yHREcpYj1sRtZO96loATeQFM4YAjWT5U6c4mycuD8u
	 evfxtvHbrmoleIVbwgSRajxwqq5LkagnKzJsYMeaTocRnU0P8oazi8mpyXjWBcI9yMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHe7KynJ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MGC4x+gK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A718606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A718606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHe7KynJ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=MGC4x+gK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794917802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
	b=bHe7KynJ+AZTI73y3s5eESW1BRD8iL8S6m4EIKI2accYJEPxRZ3OpFIuNiNHUOrM0NtaLL
	15LBbkvvFO11Nl4YdbCtNIXySOWytLDyW6gIc3S9Pah4qufLfEJNnnEnZlfk3/xgsK4fN2
	j0HyMkccQBxGFTnvjazhYEgugh8BiW8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-yGZOT9u-Pw2IQpm9qGt3eg-1; Tue, 17 Nov 2026 07:16:37 -0500
X-MC-Unique: yGZOT9u-Pw2IQpm9qGt3eg-1
X-Mimecast-MFC-AGG-ID: yGZOT9u-Pw2IQpm9qGt3eg_1794917796
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50e035a2d5so221569566b.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794917796; x=1795522596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
        b=MGC4x+gKyMgqtV7GXs0q7cwxX6Lt9ylQaq7XkUrducMCRhvpb2S5h+iQBtz18RU2dh
         ZWShdydPPdrwjAeYgugGQderMJQOqungMpewRUfNwuR/4DFBpUHKENEVpbkaN+XrUTCt
         +jLrsQlrFPXta5hT2abmvAGYdo8UwOQpyF3itb9D1hQFXpDR89S4H7WXGjNt4b4ySJp4
         CyO/GXGUhDOCt0kj8acusmu/1AzCIsJv4BZlCGbGZM/+gsBIDC2ZbBJtYX4FNvdau+4M
         PT6givg1i7che+IYdgIE0YATAk/cJrkZH9/bfk61pb5tllIT2hZ4FJNnKFrOJLUmsbsS
         by8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917796; x=1795522596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7fqqTM0ZprlFpCRUswP+RK99giuZwyTj/7wzAwsZyk=;
        b=g2xkQl+Sm7MDeKu4T7/eLFy/qKmYnyIR89l2setPdrJ4WmiryY/pn5foT1vl600OX8
         fajVFMgGHNdT0t5308Z73najElwvoMJ+sd5y4U0fyR4qtugvipBm672+PeRrbIb9splQ
         LMONnlPDowIa6GwuIhKkDU8Q2uc9rPIkDwVoJk3HiomgWvCHeE1VY4c4dZqBknP0aW5C
         cmHDl0eF2GvwdBATw3/N3KA1UZGGEbOzwAry4dEojnWSux2uk8BdxXtRn4p6nQCpoqzN
         KSioIuuf0feH4JRjfXqmbp4dH7uMnDGWG0Jx6Jf6HWlvzskZux7o30uz7Qxm0etJt3pv
         a0aw==
X-Forwarded-Encrypted: i=1; AL+hErHH52ggj5lgie9RDRsTr5i3y4dYf+1JhblS97jAlZ/lnu/hwdICL6H/9eyd1CJwW1BY7RV4vAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oC5OetWos4wBdTUb9Ue78HYgvw+kgO/nmUr7pSsvSE2GVMOve
	wGs/g9HPh1m4rxeUdEKYLk15w3tQ6OL9y5ilcq4v6NS2CLO4xSHskNlPdRg9ViqkTPWB6cFNV3R
	+JGIsIpcOaTwkBzxKL0ZkwXs63/4Br5HCAyXsp7eyugSUPInjMI2l7kWx4hPfSBsejg==
X-Gm-Gg: AYBFou2q6ncNT2aMvEEvoR/s07mivpYwt0tb/t/Lfcs1f09tqvwlxJsgiWZ56TQfhR0
	xN+kdjI4FSMJeRgMT0UmXcwyaMILHN8o3FnGDe2P5qi+OnInfToBDgMCpD5ghd30mPnDELT//sD
	oNsagvdUVhBC4lfMB9AH1EY6kQhXTzGmhMo8waNRcw9tLoFx/K1zIlpG9turJwAzhff7lr2SBCC
	m2m9W9rmwE34MlJQRRRSH1RoUQhZnwlB9URBtQhkUOq/5NhlQ1ARBNFVUfb9W8nmkymMy044IJk
	VLXnQV+7B9JQuAfXI4Vk9gP8sYY8aFGqq917X7EHcwz5fA+Zrc3eW8iP5EWEy/JyOPAPZlj6qbL
	GfbZxPl7yggmcQj2zSdiDnKHvryvqsxzNaVdj61cII0tXXVap/ucN6Ak6d+CD6+nsR9Hz59dZ5J
	coIXsCtg91HqI7HiMCQQrUtutoyhaON5J+WLMfVgJa6kDn
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr1133543666b.22.1794917795633;
        Tue, 17 Nov 2026 04:16:35 -0800 (PST)
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr1133539166b.22.1794917795043;
        Tue, 17 Nov 2026 04:16:35 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm3726606f8f.46.2026.11.17.04.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:16:34 -0800 (PST)
Message-ID: <9fec496b-a01e-4701-8c4b-0f78fef2ab48@redhat.com>
Date: Tue, 17 Nov 2026 13:16:33 +0100
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
Subject: Re: r8152: RTL8153 never runtime suspends with link up on a network
 with broadcast traffic
To: Paul Menzel <pmenzel@molgen.mpg.de>, Hayes Wang <hayeswang@realtek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Chih Kai Hsu <hsu.chih.kai@realtek.com>,
 Birger Koblitz <mail@birger-koblitz.de>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Adding Heiner,

On 11/11/26 01:52, Paul Menzel wrote:
> 2.  If the hardware cannot do it, would you accept a per-device switch for the behaviour of the experiment, off by default? A module parameter is surely the wrong interface. A private flag (ethtool --set-priv-flags) would need no new uAPI, and userspace that knows the network configuration (systemd-udevd .link files, NetworkManager) could set it. Or do you see a generic interface for a "runtime wake filter", as other drivers that runtime suspend with the link up would have the same problem?

This is borderline, but I think a a private flag could be the better option
> 3.  Is losing the first frame that wakes the device expected, or should it be delivered after the resume?

AFAICT loosing such frames is acceptable.

Other questions are for realtek guys,

