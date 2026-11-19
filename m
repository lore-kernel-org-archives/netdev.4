Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091087;
	b=aMcGBdMAc85QHTaQza6A9b0SJ9geFW4QyBgr7QPuLTdHb7JJO1jDDg9kPX1UZnGQwL4P
	 UDTwCXOgLh5BzLlzB81/h2Eyf7LmiwPYXzh5wCpkN5PXVelWyGaHC4td1SjUBaik0PQDr
	 b+ouirla4NikZKmfu2zw6WQbuTwXOIvWjDR3xFLW0KDR7tgbCM5Lm8uZgg1sXnyJXhK2b
	 1Rv6teuQItmsHSApW3w9fBOyFH80CwHW019JyIZf1Eh1QCtg8QcufJhhW1SuxQWmOBdOx
	 XMdAKlNLc2ARgFuvPxAgiOym6BhXNOGiMZCcJLpAtjj38l9D3OAqf8hJZ2FIeTd2lZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091087;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L7wE3tSS410sv2V42qZnSWfqMjCR6vRrIZ4ve8vCytQ=;
	b=Daq3s789VeaH55SRDz2n+Dfyzf54gYUqYmvWPtnncXaDwxqMKfExv7hY48TUuP1LPBuE
	 fKDPRE1xZT7MHEHoa6SMeGyRuEj7OKZ94NabrayPmmmI+bHv0zko74LojuRQ0o4IH1/1O
	 p8ae0GwHiLa/Fw24XQ8nVJqUcPwn4DZD+8ed/dnC2xZn7FWVCDqosahrNGemsD/5RGp9R
	 FCtHQ6oSZuQI78/hg5hruaOrRw5vSuB5ZTezRQN4BZRmwJzuSXFia8sveWF6oTEmnbms3
	 +Tq5CFgddwUTyEh5dWqyDbsQ3BAlszBga4cofwphgfy554XBa6tTWaynmjn2grVLJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=deEFkpjX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PnhTSmne;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292C7606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292C7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=deEFkpjX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PnhTSmne
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795091086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L7wE3tSS410sv2V42qZnSWfqMjCR6vRrIZ4ve8vCytQ=;
	b=deEFkpjXoy5o2tBvbdm5V2ON8GHHAIz9vImg0mIjc7mX9jgxeCqkGLHkssfntqs0G/5Mz3
	L9XW3WjZBsdWo6DGpa1kVN3HRnRrAQ0YxD7YQ4G7QmF8qYpxHsNfpy8B74Nz/8Oe4LA7bt
	S+aiPIZwtLcA5zFnS58XmTtjYiHDLbY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-Czq0RcgAPzmWvT-K1UFp7Q-1; Thu, 19 Nov 2026 07:24:44 -0500
X-MC-Unique: Czq0RcgAPzmWvT-K1UFp7Q-1
X-Mimecast-MFC-AGG-ID: Czq0RcgAPzmWvT-K1UFp7Q_1795091084
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso17224335e9.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795091083; x=1795695883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L7wE3tSS410sv2V42qZnSWfqMjCR6vRrIZ4ve8vCytQ=;
        b=PnhTSmneaio4WgnH3FhNEZnH9zZOLJ1G1/hrz2BPLiET1zXjzna/DREmFaQsmbUxPb
         Oyy6z+HATrzpBnGrxUIHl5aZoKCa+vktPHWV9w6RgUvluubFgzkQHkaskXhgwa9sXawv
         /QI/U6IOPo6fDI/MxnvlKXanQozVMN5CSqG/TXS63xN5uIWl32BdZqcBulU/YBqZ3Z0a
         TwAajwuP81ryRTi9ZQazWEP/f/Yk4IqMGtc4TTnZyAdM2FrWYlwxZMhZQ+uPxQL3GmGR
         MbMmfJhGN2aILRPvdO0jLhG0CXYML/TVh+bc0LLyUr/HBXFoEHdghAHEfAn6+xPOzryF
         xYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091083; x=1795695883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7wE3tSS410sv2V42qZnSWfqMjCR6vRrIZ4ve8vCytQ=;
        b=F+EArlPEZ3QGXaRyOp2DRhcl5laVkoFzquLTjZFUuAhnSSS3L+9+O90eBnz8RZEmim
         vma4J5vlQaqQUo/s4TNlwikpVfs5mo6GJXNPchybIANw3SF5ldrXFdfcX53brJuZZVRx
         yNJV2eO9yqqCPiLnyXtEbzQBQ8Q6VLsTM87vw8Hy1T6WcEGIBUfnem2S3QmUfLOU4CX2
         kPzba9Hmzd7NiTAXalRFOid8jU6zh5FBb5IN3p4XILBrATUQTb3RFPGofza+WGNr68Bw
         Vgar8bpoXuDDgebLppVPw4RqYGCDvQQwn16ypjLjfJ4+k3HvzB/vbyIaLMmWW9Wpk3w6
         1Xyg==
X-Forwarded-Encrypted: i=1; AL+hErEAYpvSbDMO6cHg7nyc5EK/xq5Gl33M6Ypdl55EcaPHNBeLwvqhESF0XKI0Pzm8frtHcOXrbrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/44tx8KKmg+JZJ6w7SYDbwvUIlKQI2hEZFsCbnsMEROg/JG4MC
	EwCdOPccwo6vt7SAE+zhaGX2ZCXJUPObWNLy6j4Q8NqhO/Ht9G57S5Wc6/20PPix70vUsYcjzaW
	tMdcaar2ujGsxLT94zdzGA92oqs+g9eYLTbNCQFmHewBxJZINJCEcHXw/UQ==
X-Gm-Gg: AYBFou0GXcz+bwBc3EC3UTwWcFu4bBX7jNKzpfZa4LHTKwhdG66ofdUjOPeOM23no4y
	qI6dF1ItHaeY9K/aPPx30lkJFVp7ZWtDsxbgmctfVLhC1Ws1JUxNugYeUjIFExrGP66thdEoEgN
	31qcOO8/DRD5LqMiSfJl40een/Zg8kcixFCgHxOQaLX6RqF97vHeXnxPO+sMQh7A1oiV02RK/b9
	otcySJsJZAFpijf9BPfHtghSBdYOisw8+OO/pa6lbmDyCLvFWdu65nEGD0T2qbNJ9XQv9KUnZp0
	BNJNQMdFdy22eEHbmE7gdQ93IUDZR5+5QRW8eeDz/l6CU2VQLPVkHDK2eWlcXt38DsbJAsnFGHa
	Ipsl9y81KmrWHsj0xQz0Jk3Nwz/VbPRlFPEnVaCc5DwYJJZNxTU03pSSeagsrQMruaQb9+BloSV
	7UD5+soQ==
X-Received: by 2002:a05:600c:190e:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb7d5d4387mr125077995e9.2.1795091083582;
        Thu, 19 Nov 2026 04:24:43 -0800 (PST)
X-Received: by 2002:a05:600c:190e:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb7d5d4387mr125077385e9.2.1795091083137;
        Thu, 19 Nov 2026 04:24:43 -0800 (PST)
Received: from mheib-thinkpadp16vgen1.rmtil.csb ([216.128.14.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535bbf7sm40733025e9.12.2026.11.19.04.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:24:41 -0800 (PST)
Date: Thu, 19 Nov 2026 14:24:06 +0200
From: Mohammad Heib <mheib@redhat.com>
To: patchwork-bot+netdevbpf@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, edumazet@kernel.org, andrew+netdev@lunn.ch, 
	netdev@vger.kernel.org, fballuch@redhat.com, aleksandr.loktionov@intel.com, 
	luoxuanqiang@kylinos.cn
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-12 (i40e, iavf)
Message-ID: <av7qBdVhmyhFKdai@mheib-thinkpadp16vgen1.rmtil.csb>
References: <20261113004602.129864-1-anthony.l.nguyen@intel.com>
 <179505360728.2713881.10859053822875993430.git-patchwork-notify@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179505360728.2713881.10859053822875993430.git-patchwork-notify@kernel.org>

Hi Jakub,
On Thu, Nov 19, 2026 at 02:00:07AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Thu, 12 Nov 2026 16:45:54 -0800 you wrote:
> > For i40e:
> > Mohammad Heib adds missing set of VSI down bit prior to calling
> > i40e_down() as is expected by the call.
> > 
> > Filip Balluch fixes incorrectly provided Tx rings in error path of
> > i40e_set_ringparam().
> > 
> > [...]
> 
> Here is the summary with links:
>   - [net,1/6] i40e: fix napi_disable hang in i40e_down() during firmware update
I noticed that the entire series has been applied except for the first patch.
Was it intentionally dropped?
>     (no matching commit)
>   - [net,2/6] i40e: fix freeing of TX rings on RX allocation failure
>     https://git.kernel.org/netdev/net/c/4957f668681a
>   - [net,3/6] i40e: avoid resetting BQL state when freeing temporary Tx rings in set_ringparam
>     https://git.kernel.org/netdev/net/c/e3916fa03f4d
>   - [net,4/6] iavf: fix QoS capabilities memory leak
>     https://git.kernel.org/netdev/net/c/65f6ffb9001b
>   - [net,5/6] iavf: fix ASQ command buffer leak on init failure
>     https://git.kernel.org/netdev/net/c/2a1f106379a9
>   - [net,6/6] iavf: add missing PTP adjustment callbacks
>     https://git.kernel.org/netdev/net/c/adbc4d0fff64
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 

