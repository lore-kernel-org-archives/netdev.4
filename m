Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619470;
	b=Zf57IqMx2Rh3P3lwECIRRtpkJpRmVni47aqgossplDrRzE2tJ3K3POBX76BWbCoLsCAF
	 fweeVjcwmL4QNmHk+vOvZyGLd3RIPN6uw5vvKlYvyKimOtfyE/RG2uBzBfT76LVdnkdrM
	 zaAtsu7rsEOcncIY7uBcAVxVWHtPr5TwhMkd8hLRJuculR5eOEU1i8dWPw0kYnJgPvNGv
	 2Ed//L6uWwMqSe7OM0jpyG612BStvJIpCIcDlxnY/uSZMKEqzpr36AYKwmQyb8F8KaqMY
	 KYMs1xw+exptHlz51Qcc4oYdW4rH1u1rl67ZJEw8CS0vdLnHknogc/QsPErfwMVWhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619470;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PkWTnq3QGEWOAEsTJmBvYgTivoElo5W0EbnVtg6mVLA=;
	b=BFNUMAUcg89KFkCGlRbhyX2/qw3/wpHxSdGq835GQTYDLm7eIEk0401IB8wD+FqdBZum
	 AdgNK8Ass14edmOtP5rTNb+RkVEhTukdGQy9Be2yfs7Pm6s7Fbeg0ALZqBteLHsWK1XdG
	 z1eYkNnDnGg2ygI95gHYFDapRoioM/X/rNAQDG1B8IwzYKbbc5oEoWei6soRQQY7vV6cT
	 N6D0ox7o6f82HO0OjhgvqyLtSftLglx7/3+EiHEEZ8VK6JUcxPjOgPqaN1nKCjv7iMPg5
	 9xr9+5533cNafzZ151QU064zxHf8iFfNXKi1xTbml44XinPUEWEfDarVottI69h/TgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KAIjgkam;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rtTE7qMy;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C605606A692
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C605606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KAIjgkam;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rtTE7qMy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795619467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkWTnq3QGEWOAEsTJmBvYgTivoElo5W0EbnVtg6mVLA=;
	b=KAIjgkamlTYFGucxk8T3VirvrD4AjBegTtbTvAQuarRw1GWxKPjwZkojGX2D6H65/78AH0
	ahT2iVT/aSMvYGXhkWfGiAOJ0vSTIAiPk68VpW5Qlb9offAbWn+8Cyn2i7CWkpITLwgZEl
	U403l0Vmg8Y4dIcixdjcmpjdhNd8Hz4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-w0AdpP9WOTO7aar3Sowgbg-1; Wed, 25 Nov 2026 15:10:55 +0000
X-MC-Unique: w0AdpP9WOTO7aar3Sowgbg-1
X-Mimecast-MFC-AGG-ID: w0AdpP9WOTO7aar3Sowgbg_1795619450
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso3322147f8f.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795619450; x=1796224250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkWTnq3QGEWOAEsTJmBvYgTivoElo5W0EbnVtg6mVLA=;
        b=rtTE7qMyUl3BOKK8xFVIQgdB+opMrGwuaSard2vdN5SAKktiF0j9bNYd2Jka7kn98w
         4SNnBuuc/TqTWYCYOpmf6ln7M1MgkFf8JJhrKZ4D/NACMjJ2tvoefComJseGW5IvVfGo
         zKh34fT3K9B18YxlD3xAucTUxHUXnvJGI9724JOllGIAQeAK3jIZWFxQuoKu1QkyMxF1
         BaVSQm/9gHQ/TxL4WGQbBFhnl2ZtWyg8JeALMx84vEWdkEU5sM+SnDRyCONgvMqYBWGB
         meAbH3oqYZQZnBnEjIlsZ/SkwEkHu7/fAkSFBqV27fahWsXfS993Q4+7i7GfjhkaLfdU
         zLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619450; x=1796224250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkWTnq3QGEWOAEsTJmBvYgTivoElo5W0EbnVtg6mVLA=;
        b=t9yHepeIYIlE8yTRMI8YXt3Q2pk7gyxwuDg+rgL4Xb8DGKWqJVui/cGq5y6uQDFtI0
         Kfv0ABGg73+0Xk2RIQyA5dVtTkX9afyHv+gTy8MKHIzS8M4uiyfrjtwO3vIXVtynVzcH
         YimC+COYn4Ts43Mjd1Phkh+hZ45+jIrdLkddm1yr4g2w/iScjZGuxKDoZP5e7ZpDM/Ql
         9niy1rBKdf4Q/nD88uCP2w4p4wilzuZkH7dIfqcEQwrGUrvLu8OyjAHJpuqc51NHCKaC
         z0PLRVCGZni0D/lk6EHcgFrIhRr7++v32Vu87RvfV+c/wJagzOq92Ygm7eJ6gVIY2qmp
         W/2w==
X-Gm-Message-State: APuU4Z/CtQUiMZFcgJg7dwcBPbHssOu0GmX8pRcTsmVDbUJfJ8IcVzf2
	K/vvNs25wnVoxBhb5cTjujgNXd/3E62jFZv/ToUXu2L8lSZsrO3HkXvvMc001WY1TIoZ1Gepc9G
	PhdPU3r57+s3xfc6ylmjpAp+ilGWafKVEEjj0pLB0nuEoSb5/A3huRN6Tbw==
X-Gm-Gg: AZFdTZevf9FYR1Q9unbHmBmWWXfnGI6VwRlH8P+dFX/pPf/PUwI2yzpIZtnnuurDPOW
	tHzX3SIBXKr/Zuj16RCyaWtpc9CGagOM/koHnQGLidtIe9h+PfZ8jaaVlvg8u08NaVC8wZAvPE1
	azraA9uPsfGhqQXrVZYyujDS6s5Xz5OxXyCNuTOIBltBS1MS4tkEw1sXbNd+BcjOA6CSuZ23N3p
	pSswOyShCZUnEtS8NiG90O0fSBzV0Twn6W2dA5Zn8s9uL/UntSSu5Frc0sOMGv7y81jv6Ua/c5J
	wTsTxrisQuxOkDSxl/5pMNFkm1G8KrC4zcdSsYEeOkZwepDlY57DiPWj1XGqJiBEMYiUD4Xy3IU
	uYsjL9LESlha3kK905kClD3sBHq33gyTITncO92Bq0KZhd9n7qBwYSE3E1WmFX2bX8+BulcBNKz
	7mKm9/S0rPKC1Fs6brZ2o/8jSVeSCLRyjDz28d883cYWj0
X-Received: by 2002:a05:6000:4812:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-4abb55185e4mr34849838f8f.50.1795619450197;
        Wed, 25 Nov 2026 07:10:50 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-4abb55185e4mr34849772f8f.50.1795619449689;
        Wed, 25 Nov 2026 07:10:49 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm29181736f8f.27.2026.11.25.07.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:10:49 -0800 (PST)
Message-ID: <eedb9d27-1738-4911-bdf4-327963151e96@redhat.com>
Date: Wed, 25 Nov 2026 16:10:48 +0100
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
Subject: Re: [PATCH net v8 2/2] net: wangxun: access queue counts consistently
To: Simon Horman <horms@kernel.org>,
 "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, hramamurthy@google.com, jacob.e.keller@intel.com,
 przemyslaw.kitszel@intel.com
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
 <20261118081329.39551-3-mengyuanlou@net-swift.com>
 <20261124112414.GJ31322@horms.kernel.org>
 <15430CE6-8AD6-43CF-AACF-1434B5EB666F@net-swift.com>
 <20261125113050.GS31322@horms.kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261125113050.GS31322@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/26 12:30, Simon Horman wrote:
> On Wed, Nov 25, 2026 at 09:36:46AM +0800, mengyuanlou@net-swift.com wrote:
>>
>>
>>> 2026年11月24日 19:24，Simon Horman <horms@kernel.org> 写道：
>>>
>>> On Wed, Nov 18, 2026 at 04:13:29PM +0800, Mengyuan Lou wrote:
>>>> Queue-vector teardown clears wx->num_tx_queues and
>>>> wx->num_rx_queues while the netdev can remain registered. Lockless
>>>> readers may use these counts as ring-array loop bounds while teardown
>>>> is clearing the ring slots. wx_xmit_frame() also uses the Tx count to
>>>> select a ring and must not divide by zero during teardown.
>>>>
>>>> Use READ_ONCE() to take a single count snapshot in the lockless readers,
>>>> and use WRITE_ONCE() for queue-count updates during scheme setup,
>>>> teardown, and allocation-error handling, including the VF queue setup
>>>> callbacks. Keep the existing NULL checks so a reader that observed an
>>>> old non-zero count can safely skip ring slots that have since been
>>>> cleared. wx_xmit_frame() retains its zero-count guard before
>>>> queue-index modulo.
>>>>
>>>> Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
>>>> Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>
>>>
>>> This patch feels more like hardening for net-next than a fix for net.
>>> But regardless the code changes look good to me.
>>
>> I think so.
>> Should I resend this patch?
> 
> Thanks,
> 
> IMHO, it would be best to split the series in two: one patch for net and
> one for net-next. And resend both.

No need to resend. In fact both patches must be applied to net-next, as
the first one has a functional dependency on a net-next pre-req.

/P

