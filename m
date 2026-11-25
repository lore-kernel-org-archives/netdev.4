Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605946;
	b=e+WcSBhnU2IWZtDpAkLqc5FXUtMRwWY8SfyHitWxX5R/5FdJN606aeMx3G1GJc47bS1M
	 w1tGnop39pbGYBzXlSObzA9nwHcVtRQv4ufyd+YmaTjjAOt6+PHMamxmLwRsZiPH/U7ZW
	 yHVqcjhh7cORY24VI+m/+vrKGjFb1DbqZl7MzXl3O5PEbwfD6EIx8fF2OgXLp0j6+WQbJ
	 o0QQFz/j9Y2QSyhEzcB8Sw1lacgQm3CE+T+50YduRsuQBxAbzOabLOy4BSOtIWurgQnuf
	 J90YVfh0xCwQAa/ET4x8RpS+qJ0LhMgWvxN06KqgyIn+SFiAk2VgEgsywhO7hdRQcBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605946;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
	b=cdgKliYVYFH1mcXpDRh2GOs3ON1mgcujrPhU0lRkdx5ICuW/kvwT58j1Wc0Ha/B5yzs8
	 mwHK0VJvRRW6iAsjVt+MD5PAyaFH1kH+zflHk3XauBkvQKMQ7+eOjqTLm8KyI2f0+0l+T
	 GEdgOmrG5rlX/1HUt4/tkEJDNO7Yz6DDI/+GD24r6oo6DR5TSl7/rmT/TJCgDX/hsMcbt
	 AE4LSPgrOnxNOW+oT5ANJmeftGRMFlIphcA0tTIUuhLbG6gtLaOlY3DaYNWYmHbsYkCn5
	 rsNzCaaKRXmi5O+K6crcr+FyfH/wCrXQeZRFjKPjJp0M/EAFGML0JgatQBFTLJaxMsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVraP5u6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E4+SJoWw;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE80606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVraP5u6;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E4+SJoWw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795605945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
	b=JVraP5u60jyPy8Bx8xIMMK3cIyJELE2bQeo7kS2AwtpBnnDzVogEDJSuFWRrlBOLWM+ahB
	1gAkhaq8Yb7Eax4GMb758pSIpMCQHpeLydG0OFGTGtvE2yZV+eer0bazk/HefMR0pW7y6f
	1VKBkjt9G+GMVbNcFvdNzprCHIgsX9Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-wLNpGu0fO2qGw1IYv6WPMw-1; Wed, 25 Nov 2026 11:25:43 +0000
X-MC-Unique: wLNpGu0fO2qGw1IYv6WPMw-1
X-Mimecast-MFC-AGG-ID: wLNpGu0fO2qGw1IYv6WPMw_1795605942
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb9379a835so24556165e9.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795605942; x=1796210742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
        b=E4+SJoWwJoh6vbZ5OXT2i285j++lIr9qKa+10+9JtvuG9+Yl2Xv3FYNL3n9MNbAE29
         UARhIn/pQKjSPyHKQTjb2X8FYbO3d0epxtF51tfhw7IgfsabZzC1QllWo9bDUJocj5eB
         MpfePXjuq6EMjPz4lLaoDbA5PyDcQhyIDeTFQg7ik40QqZu7J8bmQyslISq49A6uHrp9
         v6D/6OGFJCDDnHuZgpK57ua0fo6Bp+XssdcNz/uTKqRLVARGw5V7PHb4cnPgEz3Q25km
         K1FK44qUxtwGModu4nnRjDkI29MAahmBUnklnlge+l3hKitezAd0OVSNONzD6Kpf1DZm
         7f8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605942; x=1796210742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+rO3vOAJomjUcFEeYUN+30ZNzkmZMhsVCFDnpuFvzyw=;
        b=JN3XLSVmO8vQCDmsAMmnEi07cHYudtpKgXdHpEbEQ8hLjqySLdpx560or9S7+MBPGB
         LIZZ8hOJ5vHXh8Jget3m2muaCBOeVdd9jY5gP0lH5ZFbNzJSahbBF4mKjX2io/fupHks
         o+vcr97iUnzjdISD7UVxFQF/7uZ182YLZlD7/1rfSpHyhEEyg7Aly2FaRaeGjfYO8l4Q
         QzKLadfJ28vyh/CAhEU8O2lqvoroVlEHWpiRhtECtH1Z7rV+pS6VygR8OC2DQDoW4YH3
         OqY3EVrlMEB8LWZsjZZU/MFu+Ee2BIZ5kIwSBX1AHDNYLHc2JHHZl+0z1sZvu50Yu+7r
         L2Vg==
X-Forwarded-Encrypted: i=1; AL+hErF1bAxThSNH7uhWup8DQkmylMTtHL/vC+CtqmaZ/mnDP49rG3HD8bLl2TpT04uNQbXIdcD3UpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ahtdw3WiRgLMfVczH7ukxGMk5XZ3c3FMUhtU46WpbVlFatSUc
	wxckdMEBAuUiJvRMYBd/wLRfgK0S/o589jjOjW5EOoMruK3hDj8WCapWK7JBWZMORYbkU7IEa3d
	BoKnZH2RXnthMDOPFdgefE8hLCrY/d9QinqP0VUHMeGsXdG4uVwZo9HLrgQ==
X-Gm-Gg: AZFdTZdpz3Yl+a17UmXbGiiSih30MvhVfpNPxkrliMcSGOzfBMjoXPI1LijovaO2BBq
	aY4GY6tSnPYHaSPLrkgQWsKgmfBukGQsQiDeOv/WgEh2QyGR8m2jX/yX6kmpef9h2RE60HLqyC+
	HldfSI5OFAq/3N2tC3sswJWsMCfYjiaGv2Ukfego2+SW4dqUiz8T3/cWuqOZD/QzAbO4BtidVAW
	5FwdYiX5Y8b4ZpFocJn07DF1WrkC4Re7HD8y/uFNCeP0rxG7soITmixGR1mvdUj1qrYO/n95RRg
	tasO4w9V17P13RjZoAEJQkaRBZ6LQTHuHJWtjY7AuY9rf6gDlcY+zAT3kOf4yGKtKJNdMguRS/J
	HcNBUYotmir12jQoK+hJZajqnFc4oR7galaPOvwKnwN/2tjKZ1qSoOUnQ/Mr+vBdvNUFhJXyeEs
	82kL/vP1N13MtRbuNpoCRvCJjKwbfaF7fM/Q+V2cLeorho
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr408781865e9.30.1795605941960;
        Wed, 25 Nov 2026 03:25:41 -0800 (PST)
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr408781405e9.30.1795605941527;
        Wed, 25 Nov 2026 03:25:41 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm274230175e9.3.2026.11.25.03.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:25:41 -0800 (PST)
Message-ID: <4ca5dd8c-ef36-4b5a-9f9e-223c2a29e39d@redhat.com>
Date: Wed, 25 Nov 2026 12:25:39 +0100
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
Subject: Re: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe
 failures
To: Simon Horman <horms@kernel.org>, netdev-bot+sashiko@kernel.org
Cc: lcy8047@gmail.com, michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, vikas.gupta@broadcom.com, andrew.gospodarek@broadcom.com,
 jacob.e.keller@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118050716.3873167-1-lcy8047@gmail.com>
 <179515123717.3136.1891710789877841672@kernel.org>
 <20261123165340.GH31322@horms.kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123165340.GH31322@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/23/26 17:53, Simon Horman wrote:
> On Fri, Nov 20, 2026 at 05:07:17AM +0000, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 0 · Medium: 2 · Low: 1
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [Medium] In bnxt_init_one()
>>    (drivers/net/ethernet/broadcom/bnxt/bnxt.c), a bnxt_pf_wq allocation…
>> - [Medium] bnxt_en: skipped bnxt_clear_int_mode() on bnxt_pf_wq error in
>>    bnxt_init_one()
> 
> The two issues above appear to be the same issue.  It does seem to be a
> real leak, similar to the one addressed by the patch under review. Yet
> strictly speaking different.
> 
> I'm indifferent as to weather it's fixed in a revised version of this patch
> or as a follow-up.
I think it's better to address the above remarks in a new version of this
patch, since it's going to touch the same code.

/P

