Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050671;
	b=3qCl5nw1jYET8qvcr/HHRYU5ZVocs4L2ytxMpXXfypzu8de3OaPOnuvPTuN3BK25/f+u
	 LMkpp+m4Ywlwtpa25SIb/pjEWTcgDZThAKLkCXwrOeA8c1YglWWbSZsTvpyLdWqsDH7NI
	 gyDNtHAztaFPnzcwFS692TpVuT6O9sgVxD0UmmVRYiHEO2apT1P5tw5m/UAL2DF+FvV/L
	 1/a28sAdYZokEvF4WgdHp1FnzYfzl99sjib13ylrEVp4AvD+qm7LvAGf2hm6U1zD2YtHx
	 VvOq1jbH+NTHRZVHapmgFZBiIW3PuIwRX+IimPE4mkMFR/1ONZWXQ/ocfUOTkxo72Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=pSkuji4kXwZcd1ydna+oHa+tnDhj558qTFgbXnb/qHI=;
	b=MIV5lGvPk0RnVoTwFYH/ZZYJ9lsMkOqWJ0iminkUwvd3GfR4Y9Fh7nSM7Tw0Y/5hZWsL
	 d9cD0yOEmjniMbqdxUjBErM7d6+BEtixSAMg8mThjTQ+k0tXPBWO0DUCdQoqF0SseTyMZ
	 sk5gLUqLm0cQgccE+ZIbQmJbP/4lLbeqTAALEGV88+/fRyfSfQNo/w4YpsOzWqwuJ0cpZ
	 hfAPJBR5yw6FxD30wHITyX0PDoz8vfvTXmMiFrW9Evad5tzNSHADE3JTqWS17DjR5jYgj
	 7cMUbFVqYbGXr1YF5iVPPe8VE4Wb/b06B6UnNA8wUcKAhyT+gmcry+UNCYFLKb6AY7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQxjWr92;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9888A606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9888A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQxjWr92
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1283512a91.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795050670; x=1795655470; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSkuji4kXwZcd1ydna+oHa+tnDhj558qTFgbXnb/qHI=;
        b=AQxjWr92FxP60mndSKV1WTxMvlLowBCe4ISf1KUb5lLrWmFDGKOqW+rvkah8HZubyT
         xmx6n2ONUy5IOJNNxTrL91ftGOtwfB1sWkrm06UxgLyrLdHYWG7i/evZhXDs2j3wm0S4
         L2/kS8SMInAdFLQOYw5m219eN9iMe/ALzLEZRZ9mzRti9mbEFfMj/hrQMBFR1eoy2op/
         D5A80+nsjMEDab9wzjTy3BhVjDZbyxNs1wEgLVlN83T+ngwRY+FNpSe8bl/PdZFGHWB9
         RqCy4BfRqoZJemQ0BRqZAmRaWIvwTnzgWA24Cs1qZkIfMyvmnUeYw50P0z2oABLVlTwy
         ZvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050670; x=1795655470;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSkuji4kXwZcd1ydna+oHa+tnDhj558qTFgbXnb/qHI=;
        b=sR5eGh4xi3HXULZ33cDTBHlK4+QTnIjT5kNJflcIqzcSj3GqbfDvcTUA13LeqYMAOU
         qR5Rc2e4dJogrbaeYn8yIjYE4LzgP2lR9bTEPraodQ1dOwx3pHovIXQgiXOmBf4FQ55j
         037DQn0c9C9xkywNEWZebUF06yQ++H8dj3IIk+1fI/wU4xLw8lCV/fNqUNS9IBVCIw8N
         DsSczaWN0h5DdW8xKXaGEOzvmVdJWytqKV/3+08uQRN6A5Pxg9rkmZkRpBaJKXkOpnok
         4bEDa6mOdFC41uHsmyoajfM2ClfW2qTWu4aA3VHopPcxedH2RCGpASt+6hMq+tq6piNj
         y/Ag==
X-Forwarded-Encrypted: i=1; AL+hErEBrqjfnRKLac+8eGTs1h55u9eRcfPqvCWu56eqrsE+AU0op+Tm5aKTV6HFVAiIIGf9X+O1NNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JTP2VD3xdt5SBjnrejZI5yZXRJbik8YW4hV307a84cL0cPkmN
	/OC8747oLQW9YcNSMhUZ2IBngQhElzVA5utUsgLD+fY0xVkVUGVKK3dc
X-Gm-Gg: AZFdTZfBatkWRbG21TJ7I/M32fbTGos5/Uko8OezXTxGYaofpnlw3qLqDpcaERI0QdM
	z1ioYnscUfVwugfxaSVl2QgEiJ+/+2cQv4gp/QZwALVZmtayXewxcyXkm4mT6zxiZBKzWrflK81
	6kCwtVvjTAOBD5ZrkV9jMNnpCXx3ww+HyNccfILVbezZYB8Ud05OkYgTmhmCtJYxzAt4YSNHMsi
	5CjdnJSDjJ58J9YVIImNeSiwdT6tYlTUdkF6ZfEqVQou4fdnIIIbwS99/YKyb9A7N6H9FKR7UK+
	uqVmQr6L+NzaiErlFGVxCwnc2Mmvi6iAyjIJmyVtrMQxglBbMp3/fkt6HSTSLMWE2dxbMfajEwB
	kmYoW7VjtVKcg5oeuGj9RGCC+wPRtxzuMdZ3o3cn+mOzn5+qJ613qTm1Dvxa2ETmBAKi/AoUkdu
	9/iUFAHWas/T2WqCWj9kfBxebNixH+6eQZUpkYgp1mNyYgs91DHBwNhuezflKHM6/ucpr2b7cLL
	YH+oUGH5dkz/O+DvzARWusSIDztkCyK202t3Tj8s89Mzy0kMGgYFpUf9EIXRG8/AI84RNj7EpTj
	Hc5Dg7imONO3oODFNpyNULpdIsgjNU5GmBmKx/VnwQbzjwTUKVcyE24X05SdTgvzQTmOcYaUUQ7
	rSOIlKVt+nDNVmmOV8BJ8Sxsrok+kJgZsPybq
X-Received: by 2002:a17:90b:4fc1:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b3d07ab104mr4002171a91.45.1795050669692;
        Wed, 18 Nov 2026 17:11:09 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fdf456d2sm650359a91.13.2026.11.18.17.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:11:09 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:11:08 +0000
Message-Id: <DMYSCT1OYI5F.2HSYP9MZ2BRJU@gmail.com>
To: "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>
Cc: <kuba@kernel.org>, <daniel@iogearbox.net>, <pabeni@redhat.com>,
 <edumazet@kernel.org>, <horms@kernel.org>, <davem@davemloft.net>,
 <shuah@kernel.org>, <hawk@kernel.org>, <john.fastabend@gmail.com>,
 <sdf@fomichev.me>, <willemb@google.com>, <petrm@nvidia.com>,
 <bjorn@kernel.org>, <magnus.karlsson@intel.com>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next] selftests: net: don't warn when bpftool is
 missing
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261118165338.1064930-1-maciej.fijalkowski@intel.com>
References: <20261118165338.1064930-1-maciej.fijalkowski@intel.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 08:53 AM Maciej Fijalkowski <maciej.fijalkowski@intel.com> wrote:
> Based on the bpf-net-xsk-move tag so it can go to net-next and bpf-next
> through another shared branch, as Alexei asked:

Acked-by: Alexei Starovoitov <ast@kernel.org>

Thanks for the quick fix.

Jakub,
could you make another stable branch to pull?

