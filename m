Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510626;
	b=ZMYGiOUaHn3eUmu5aKCQbN2JpBxeH0etcIsvr1TXbkj/iDKP8JvSsD+sWufw1fTL4ltF
	 1cfpzmogGJvcvwSfU+JbSwK8aOJxzAOQ5lKf4nvAMW30V0NtGC1tQpRSMxBkxCmMusQ4k
	 /Ru8ZP5vYhzSUISr8lE+SIQTQzR7Tn2wRHTlgKJUIMNEKnqzKPH1SY5IWVQVXojMR8PNv
	 pw9nNEgHfquvXkSuHJ0Iz+IbHQygGxT7Ec9HCqOSFLaa4/v/qMUw21ce0fi+NBCi9cKy0
	 FEjSzTtz2UwREGkBdnE78O+LQr3wv8X20ATm1y07oMG53M7Afn256ks6xOopYGbvqDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510626;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
	b=y9b0JXB1sTR7AIEEpJeodSMR6YXa47+dJezgSdjBUxmSa1kxgTmKaJE775oUU/Ww39CP
	 qOfLPQygKvZr+HXTVbjRXoG0aIbNd/yuUxz3LClbjCDALiV6V/6dZgHviyhOIwz5aEx75
	 TjGH4Ylicj5a6Taof8MKzqCSfOdZ/W5qKqgdWXDwT6yk2urufbFCId2ane4uleArcQp2O
	 7IJN7JX+SFlStxFO04zcs2gNmh9EsywRD7vHOPREH8K22Of1limCAEJu3M58U8o5J+Jpb
	 jLnQxWlR1T7EGIrf5fotiAdUnTYWYxFAaxc+NCAS2W2aVJGYk9sszweOmqRpjZqp+Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UiAahTQc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LWL0vBZK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C9D606A331
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C9D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UiAahTQc;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LWL0vBZK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795510624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
	b=UiAahTQcee7PwpWZYXOUnNXQyeH/TrEnMw6hHt47mcdecZSD7yykeORGZJzBS9k2Pyg+Em
	HtUsG6tgfjAYilYnLgYjSjOzBPoUgMYUO/hAALRGwTzaxKju1wxEecGXZrQNutbJs5YTrV
	aWuo9ByfAKf0b1SPKj0moIVu1I3fkVg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-otLoC2e6OzK2pBK3OUGjQw-1; Tue, 24 Nov 2026 08:57:02 +0000
X-MC-Unique: otLoC2e6OzK2pBK3OUGjQw-1
X-Mimecast-MFC-AGG-ID: otLoC2e6OzK2pBK3OUGjQw_1795510621
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a4654add56so29133355e9.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795510621; x=1796115421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
        b=LWL0vBZKheKhouleQ77PCyfkPF7K6p93c98GCqyNYF0u59d/7+NfJoHUimqlQVCGPF
         dMo8hg+JGIKGiQoPLesb288qrsRNn+vNmWlGtbcCb+B6DR78JhLcybNnkLjkhdX2WmGF
         +owQ2tPC/L2Rj0v2TcnTFjU5zDIA8VG8fte57MasWgFvrGZEJheIqaLyBrOoEW/ncJ5b
         G/S86bSpuZD0V1PH/t2bxCCUYCgJwd+Zub2YkjHPkeCHizBI5fDCCcTKXL6KYCu+kBJD
         9jYdZbflfJKDes/5YcEixs+ur1zT31MboHE+dO7qBTyaOgodLh+2jaM+NFtPjaK97lRe
         wmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510621; x=1796115421;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WBd5f8Kes/3EruJ/MjE9jyR5igXBI9F5RvCiWOQBYI=;
        b=kJGJ1VqaXK6pMBpZWx0m6vfr0g9n8S1pEmRL8LDLNP4ylOVpRRekgdFGY1BN/91lHe
         uF43+vI1PnJxauwwIX9wMLiqR8F6gYtDy1vk4bQECehK3BmfePMMOPD2/WMI4A8UGfP5
         MJ8dOqP9GsRFktY+FUjt4m8d9/UJG8WzNBgoLJwW85GpyVWbnf3ziiKi79MGtSsWnii7
         g1FgxhFi8rcSDXd/IHJaz44oBjkW637DO+CQ85oT7OChzpljwbUjJGyjQpwLucPV4Ldg
         RnC+YjLOVuHqgJMTeKqJA/SWQ7k+yvvA/v5MW7g1qsOQfAX0B5vfQ4ho6d+ZTrVckt9h
         LYyA==
X-Forwarded-Encrypted: i=1; AL+hErFE0BLaq3dmbjfnyd4p99HcXC/Up2+hMBWkUJB+7drPfSJSLc57eplobKoGYPj0ZGVCYvG8J3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cNmHqqnsYGbLPWaMlINI3yksH5KcnaWTKgIKtE1Hb1X0qDIvQ
	wLDLz6ySjgYPtgT9Ar5BxqGcEO0Yvj744blj28vvDINFxukOKzqrUniAxJZuU8UAEgVmXOscPeE
	GsBR209nSoFwndYcRPJW2QW2/vXQjRhXyEj3L7uVCZrf5V0S/sHU5lceWN/Qf4qmMlQ==
X-Gm-Gg: AZFdTZe3PpRLtsBPOfvO3QHQlFSp1GSWO7E0xKT9f6WI/X5gxpl3Qq2XUCaa78LaPEJ
	Q2T9xVgcUyNapORtpc5ZHF+kQdJP9CVsLsMIQHZaHfQV+gSiZJJkSuaP02DdhDtGDtVdJL+hxGm
	p47uTVqAcwK/r5e8b70wcj/+DPoKDblUok1q6gfFr0kDM2qjLmw474TnLC9iggIDQ76ssUoelB9
	AYJhuHe0rPHeuLS0rwBe+I3vMEvbXIuXRFZgyIRwe0u8XSJB/xZCcSGk3r8B6EiYYxPy35v8fHR
	wdVhOZrLSwqiMCUrdTYz7Q14lnkX0uc9sNHHERgJtNhbi7tidKScUL2UsqyLXtAhH0dDfXZMvlW
	lF0MJKI+OfOcBpmlj6qQ3S0fEcLthdch+6R+A09P5xpCZhNQRoFArmRczryYVNm20E7z+TYp4Y+
	6OvKMxKObriopN9pREbw1z3ChEcH8mvUp+birFKHuCtsnz
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr341148605e9.27.1795510621196;
        Tue, 24 Nov 2026 00:57:01 -0800 (PST)
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr341148205e9.27.1795510620822;
        Tue, 24 Nov 2026 00:57:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm26574444f8f.32.2026.11.24.00.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:57:00 -0800 (PST)
Message-ID: <41103c9d-5c08-495a-b5b1-66fc15e2517e@redhat.com>
Date: Tue, 24 Nov 2026 09:56:59 +0100
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
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
To: mdshahid03@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 edumazet@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
 <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
 <179544969959.175192.4403952228876691788.b4-reply@b4>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179544969959.175192.4403952228876691788.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 17:01, mdshahid03@gmail.com wrote:
> I think,I may have misunderstood this part from NET documentation guidelines:
> 
> "The commit message must disclose whether reproducing the issue required
> modifying the kernel (e.g. inserting a delay to widen a race, or[[**writing
> a loadable module to issue the right sequence of calls)**]] or using error injection."
> 
> I interpreted this as allowing a out-of-tree test module to produce
> an issue,provided that it uses legitimate kernel APIs.

Please do not top post.

The problematic point is the 'legitimate API'. Adding a delay under
a lock is legitimate, de-registring core functionalities is not.

If you want to use a kernel module to demonstrate an 'issue', such module
must do exclusively things the kernel is already doing, it should just
enforces specific timing/sequence that must be already possible in vanilla.

And if the race is possible only with such a module, at very best the
issue will get low priority.

/P

