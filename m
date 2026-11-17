Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942830;
	b=mWM8mj9oO20/HEPS0/+7voc79M2NyXbgvl0r36409ArSzdPkHPnsZFE4XPHCn/8cbakt
	 IVP23wL6aKxXjgzETude3FbYXHZb6QMtFkLgWdTtKKxveiB66dflw/W4RhT7am7L7V7wC
	 vQscGrZTk3mwEJ8DyjJyPieRKTsbM9KMOEd4TtJ9o4ahw4VmoUu+PnZDDBTC3VA/IQwDq
	 S3BmgPXbS0pxQlJi9VqNj6w3IOxREShnvm7IgVBLk0gnTFydC8pQmF9njbwAmF2a0DBBU
	 i8WBQQ0UFBNXYLdwGwPdEiSZOpLSyfMua9eJfXbmhcwMMKQ2cXqbss1gDr4B05/BKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hQdMYvTDljPfvw3jmPwCPaTjHRLJ0bm/dZ6FPmytRE4=;
	b=W+ZVzUUb7gOKOl3iBBMBIxLvMHITpbUOhpBTpQMrsPbJE0p1tORpaw2QTabucR9WgdY8
	 sF+3ladUD6dVCwct8QA7m1nvgkw91wI1WMLpcc5aC6dXFsxiOB53k5iBI2ArZmU9K/bsw
	 /mvaExGoOnK2+MMGDlKVt86f8fSQjfdvaRcp4nm/s0WlpJvCcC3YiuTDJzcOMNfbMd3Yy
	 7p3ZspLZC5SAD8oiHNdGg1jsVIzwd4SeF1TW6ewUSzNtHZA+JHHf5AwZkYVTOYVYZ25/x
	 h4DAwPVKzLl9AbKi3HJBK/UzEd5zE4eBfoP5DDzf4q5zHQQg+aBcFYlqMmgnm6g9jgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv0qvxXF;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5AA606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF5AA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vv0qvxXF
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-94960131b30so23082985a.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942829; x=1795547629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQdMYvTDljPfvw3jmPwCPaTjHRLJ0bm/dZ6FPmytRE4=;
        b=Vv0qvxXFVK1wzdTn6rn8Bs1smPyud6bl9bBzKLMXW8SUNGSv/cbkMpDwhf2VEuW2XA
         hITWVy5seULuYMNIQ9a5q0K4JzRvM8E8sDDdqMtZodrNJWmGIaBtvGgnjCLkOSm9NHiX
         gfX325gV1lZHcwmw+m1PuSyr7Ksb4LQ783W2dJ2yh2xSIt6uW9rLLkxMorBBcSu0PoCM
         z7JXmR3atBiN+oF5WRkICXSFaJivWMf+bsGXpx6NwZC4WiJ8LN4K5R03/DKbVYmqloM5
         qMPtAxTDu4VP/NdAY/JxR1TXqHxloWgxlNTs7MO9m8mqfn2jANmpKT1ALhnwdir5U+tm
         hhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942829; x=1795547629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQdMYvTDljPfvw3jmPwCPaTjHRLJ0bm/dZ6FPmytRE4=;
        b=LIotng2WbUBM+eTjvnQ6h+v4kYYftXEwAOZaKY9X827mNYburvFXv4yc51dLm1iZ+G
         k+R6tgUzbRifTIsN8Aa4D15Z4pOgsAq84l7211b1f9mwdyW7CL9u20EJFsYajnQlkrDn
         imRL3zF8PqAl+XYPLUCU123j/BWY9ydsDThq7+saDldvqKXGbPXecf65pRhuCj9xj6ja
         yZWXXlA5mHN8hLNLt7o1f8zlP8IKTPtJNzFG7s06ldw7AG7+mhHfIDRtFnKxfac8ydvb
         JQ5bfq3ZWE9KW8w2rMD9Jq9Vrr3vFV+MwrkHUadlIh1NjK4DIcR8pJAc/Ad4xrLB0riC
         qMmQ==
X-Gm-Message-State: APuU4Z8rgr4EZyDQNmHz+0crZjQj+28TtA8MWucTf8l4sIwPIsA4HRnN
	+IMvJ9DDQmsZ30koQ/qzQtS4qGqF1jWToRM1Mta/dwlmYFkTzO6ecM+8
X-Gm-Gg: AYBFou30yKeFhU88/QuaJa70vRGLd1jbj4EBLqeaXjg2thvIii+eB7i20hNHBUuuxCC
	HpkizKTca0TXrLWU3ETDUmKZewGLHmMhRHZdksP915SQLu1uNYfvnGSxmhGhksXKF4YP8sePii3
	vf9p9Zdw/QdBk4sduvNl8knosk34KO+IgVX7bNaqdbSZuOLnrhOErGqn14n4ngs8XA4JOZhtffW
	bJll60qVFbgXenTSlaRFd/GIiOxwflt3b4IaBTBvLEi+X6lAW8158QA/jcLpKcNcsbbFCDn/9QG
	S25EG4YoVmw5tnNVx0H62ETg3HLjcyjHKI2Kh6ubTk8k+iAJ685d3WQm0i+4UsRnskvIpXBBvUz
	hPj/hdcERnXcn/O0iQeTNFvFwQllQRNuaylm9JMEmZutwgnAMR579riyt1+nS9xvCur7Qgcih+F
	Tp4BelBWghovGnVeEKxkFCUx4YIpcgoS2ECEoQpGyYZsqedWSQA8KnQpTp0BeTDCP4LsxQ54uPc
	yfPwH9fteX9q2+hVUK5dzekwg26v1Q4Mf5kA+2rSTQaJGn07pxc50OL8knWbfrzXEdR9Q33vR1t
	bJPNFANkI5vzaEOkrLPFVkoLB7w4kBFlUuOvgaa+U0oKD3fndSKo6elsCw==
X-Received: by 2002:a05:620a:19a4:b0:949:7656:ca0a with SMTP id af79cd13be357-949995b3446mr121165385a.35.1794942828757;
        Tue, 17 Nov 2026 11:13:48 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803af0sm1138774085a.8.2026.11.17.11.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:13:42 -0800 (PST)
Message-ID: <fe73ee96-3ef2-4ec6-acb0-8e6794615ca1@gmail.com>
Date: Tue, 17 Nov 2026 11:13:37 -0800
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
Subject: Re: [PATCH net v2 07/12] net: au1000: fix buffer descriptor free list
 insertion
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-8-f.fainelli@gmail.com>
 <179483704622.3136.16694282680991633445@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704622.3136.16694282680991633445@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message for "net: au1000: fix buffer descriptor free
>    list insertion" says the old au1000_ReleaseDB() "loses free…
> 
> --
> 
> net: au1000: fix buffer descriptor free list insertion
> 
> This patch changes au1000_ReleaseDB() so the returned descriptor's pnext
> points to the old free list head before it becomes the new head. Before
> this, the old head's pnext was set to the returned descriptor. The new
> code matches au1000_GetFreeDB() and how the list is set up in probe.
> 
>> ReleaseDB links the old head to the returned descriptor and makes the
>> returned descriptor the new head without updating its stale next
>> pointer. This loses free descriptors and can create cycles. Link the
>> returned descriptor to the old head instead, matching GetFreeDB and the
>> list initialization.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> [Severity: Low]
> The code change looks correct. Should the commit message say that the old
> behaviour had no runtime effect, though?
> 
> au1000_ReleaseDB() is only called on teardown paths: the err_out unwind
> in au1000_probe() and au1000_remove(). In both cases the descriptor
> buffers and aup are freed right afterwards:
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_remove() {
>      ...
> 	for (i = 0; i < NUM_RX_DMA; i++)
> 		if (aup->rx_db_inuse[i])
> 			au1000_ReleaseDB(aup, aup->rx_db_inuse[i]);
> 
> 	for (i = 0; i < NUM_TX_DMA; i++)
> 		if (aup->tx_db_inuse[i])
> 			au1000_ReleaseDB(aup, aup->tx_db_inuse[i]);
> 
> 	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
> 			  aup->vaddr, aup->dma_addr);
>      ...
> 	free_netdev(dev);
> }
> 
> The err_out path in au1000_probe() also falls through to
> dma_free_coherent() and free_netdev().
> 
> au1000_GetFreeDB() is only called from au1000_probe(), before any
> au1000_ReleaseDB() call, and no RX or TX path walks aup->pDBfree. Also,
> NUM_RX_BUFFS equals NUM_RX_DMA and NUM_TX_BUFFS equals NUM_TX_DMA, so
> the free list is already empty after a successful probe.
> 
> So the lost entries or cycles only ever exist in a list that is about to
> be freed and is never read again. With the Fixes: tag, stable tooling
> could pick this up as a user-visible fix.
> 
> Could the message say the bug is latent with no functional impact, and
> either drop the Fixes: tag or explain why it is needed?
> 

Yes I dropped it from the fixes since it has no functional impact.

pw-bot: not applicable
-- 
Florian
