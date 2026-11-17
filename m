Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917925;
	b=qtiyeGXwPz+C7n1sacDI0Cdf3D1tEOlWrHuU83N9aTTEyoVbi4ik2BKHvhhBoCP8bFpJ
	 2Z9UibFQTvj1afgMp785ZKAWxIWjMCE7dWLFawGmpKXe02puacK5nRtRjFz4+BS9sqad2
	 5Fp6BWHWQ2yEmgVHAA9t9aq+3v3eQzg4DTU41QLQ6i10MYr+9hVrnpsIXFnuftrZpru7v
	 f5gCWNPf5up1UWUkjLJJZU+QhiAUimcARUl4AbIZXjE2ZGgakFpOyURa883LXTBrJcJY8
	 WZyOxaf1gPbtyovye3ZZZyN3eqbgNQ3iPdkElmkKhL5v+HxSFTVdbqwLO9jeUSSDlfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917925;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
	b=KDJW9gWjWl276iISUt/s0CYVqMGDhtwLs/ZlFhA3nVovJCNN8puig7Iqu5Li35tus09f
	 aQ/JjlEZiFUglu93WDwz+g2pIzIg5e6TicAlbxGUJBR4wSbJIw6AQyyFsAsJ4Ahsze7S3
	 tvZ3SUh6c+juCAaXYZlpfEWngjZ87ewtAsFVst/kiq5aVfAWVCSKKPa9VKwEqn7ptExpJ
	 39TfhYnTqIAi2/gADZaDSrekpHxbUvb1JpfJ4lB2eBdo0gvH9YteC852JRwr1eS+7zQwk
	 xAx4t2HTXSyG83os5N5KPAlHNCbpzOR3WKbuRYC4njcpLHFUfAVA/u3kTfLWCklvc+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="NJRGH//p";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IU70th4p;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FFC606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJRGH//p;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IU70th4p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794917923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
	b=NJRGH//pXotAOf5XNKLY7Z5jpnku8uirn7ut5+INV/3CbsEJEo9xKZ1W2bMZIzbSgz1onf
	ck8Iv8lRm5LDM7QqbqOmYy8IVXoOEGPflNhEEnOOx60z71/Rr5WT4J7B2xKjJDQkkr61ip
	RqXOuOm3pvwJ9M9wRAQaN0aWU5LZdqM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-dTHc0_6VMPW35yW_-B_gOg-1; Tue, 17 Nov 2026 07:18:42 -0500
X-MC-Unique: dTHc0_6VMPW35yW_-B_gOg-1
X-Mimecast-MFC-AGG-ID: dTHc0_6VMPW35yW_-B_gOg_1794917921
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-499ca65ae87so468022f8f.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794917921; x=1795522721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
        b=IU70th4p55Ubx0ZuL5bmx32DVMBbG4I6m575HnjpltFOGQ7riySTZfGrVYQQFasNio
         nE7E0tjrjVmYxWi96qoEwSndGiTSiyQBU8qle4Vtg+Z8kOUoUlLWOzondWvNEifqJiFg
         AskPA8PD2kaS3sMb2oJyh0YlKJ5qmnPXSbI5gtJ2uAJD5SFZnjJEqNuofi1VhCzSZ0dO
         etydb0CIiUERTqTzfqdzZGHADW3dnGfaTLlDpXiMkzwsRpSosgn3ZYEzIGpi9F4nDVlR
         aiePleUHDMs2JQuEKMEAoN29j8ZNRaq8vvFKOogbYdKsRfUMZ1eyvsj54auahabLDmpS
         V86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917921; x=1795522721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Saf3SetBsCoiktrO+qd7rI13GSO6x+2RpySl+aH8Vbs=;
        b=GK5XzIiyRXV1Ic8MVgCWpT2Hj6x+vnlaTWrOr9W+G9ef038R61pgJfK8spPAOU9t20
         M2OHcM+A7uMPC3qjkpyNaRVUrHnJAGpMh7nfVci9LV5vmD+hDaVLXPyoZw95FPaZ+Bxw
         65J1SrGKqdulYkIhwTfFT3BTcQbqx5svSd5wTPu3d5IpR17LwVz/hDnlR+EmakxvXoPT
         gjVFWMwXs9OMp3g9j90vGLHJxwdtX+sfDfAvRSOlW2ZI9x1GypRUMdameRT65wzXMGHk
         V9beqSXG7xzKQnofitTJKEecTJgfDAUbe7IgZJ+GsH/T1Pqkz+79sqG1UdWBaKzSHmES
         n4Pg==
X-Forwarded-Encrypted: i=1; AL+hErGhzCfmQWBk0OuhU4cwyK4E1fuxlQDLCHU+dTmjxihgUBr75fTHozZJE5oRzFPRKgE2uBWjgaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p3QeTDvcXNNNqDCtwZuWuBxsWw8vSRWxyGmrCb4ZEhvlM7vXd
	Ky6IwcpNKuY0cUdCDOEdC7bLRLRzzNc75SziYaJeG4D6LRWmVke++CHmxtrJASKI35EQCKOZl9I
	FBKy5dLieHcJpZUNGiMsfNBgV3CsfofFME7kWlTL9ZU3CVvjHiQpxpI58yw==
X-Gm-Gg: AZFdTZckxjVBStlPBJ6X61LH8PSE6rt+xcRQsWk+n5oU+JMWY6Mrr2hK5Pn2UZBrSAy
	UZnCsAT75EmozSimsYwU8eVBaoXi5i5VsQ2WF9Nxt2XtsIw4k7o/PKi9JHj7UTPu9qA0t0YU+xe
	4CxiEyaJV8RaOziA+6gmOXc78mABYQFqDu/jdhApTBpIWZQfMddxrJDsWplAVLfIVjVRjTXU5l3
	DvDlIs7dV4wXhHi7bjykLYz448c9mG3SGpk0G6lsAAzTJGRRgLTq6rvfLQ9y+IMT9drrPp20Y+h
	61wLOuY0gfFtN0pfQ04QIjfdFSNR0aTadtJYfo4bNDlMT5HUDbID2WyEA4nngkkbSuxdF598bn4
	1dQ5WhUJ7GtkZgiRF719kvcpE+FX2OYcHTCoLZO0i5zkSYUOibnkkzo37kJxOt+ruThNoqZdG8b
	8Y85YHtDQ/6DBLk2p5DrCsJhWLXpB0Yiz81xJRZgikJfvR
X-Received: by 2002:a5d:64e6:0:b0:499:527f:ce55 with SMTP id ffacd0b85a97d-4a377c71e8amr6033004f8f.27.1794917921179;
        Tue, 17 Nov 2026 04:18:41 -0800 (PST)
X-Received: by 2002:a5d:64e6:0:b0:499:527f:ce55 with SMTP id ffacd0b85a97d-4a377c71e8amr6032937f8f.27.1794917920728;
        Tue, 17 Nov 2026 04:18:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm28246035f8f.56.2026.11.17.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:18:38 -0800 (PST)
Message-ID: <f781b15a-a731-4698-8161-d384af5bb535@redhat.com>
Date: Tue, 17 Nov 2026 13:18:37 +0100
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
Subject: Re: [PATCH net] net: wwan: mhi_wwan_mbim: fix dangling links on
 registration failure
To: Xia Yan <yanxia@cmss.chinamobile.com>, netdev@vger.kernel.org,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com
Cc: johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, yana06070@163.com
References: <20261111113213.280066-1-yanxia@cmss.chinamobile.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261111113213.280066-1-yanxia@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 12:32, Xia Yan wrote:
> mhi_mbim_newlink() adds the link to mbim->link_list before calling
> register_netdevice(). If registration fails, the caller frees the
> netdev without removing the link, leaving a dangling list entry that
> RCU readers such as mhi_mbim_rx() can access after free.
> 
> Register the netdev before adding the link to the list so that failed
> registrations do not publish a link.
> 
> Found while reviewing newlink error paths. A UML/KASAN test module
> using driver wrappers and a fake MHI context reproduced the use-after-free
> in the driver's RCU lookup. The fix passed the registration-failure and
> create/delete tests. Both UML builds passed with W=1.
> 
> Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

This is not 'net' nor stable material.

/P

