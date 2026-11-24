Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556417;
	b=AztyIlureIMR3tGw76mtPhGY5urOYqKrc2VFdPu4ZetikvOmFqePojtGyZDvdwP1vbFJ
	 cr5yEUwCS+afX2t1Izyh+dSMSbKo3qNn/nmOQ7WWszb/Lehrd4evQEwGsEAdbV7VOFEDC
	 6XOW68Hk3GIo37D9UdfirC6dk8oDJ6rqoWqh751p+sSYhrXMmLMxz4riiQR8kuj9zPCSg
	 2WRbJLuMzIzVkvfFd6Ti38asuOrfryGU/ZMSS0MM+6g+sk1erigIl24AihIK6smzB3Y71
	 q1kGXQALfEdi+X0+xJlVsRyYAuiIA7OmHTLqsERu2dkBhiYbcyGPGzAgpKEn6ua5kfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sDRbsF0JGL+jAU1JBrFF1i/9HLwj+8h6ukbD4y/bsss=;
	b=hwqyj7ZzMOiPySNkKUQaKcTMuRSwMaSlRalzOOttzKXKp/Uiw6Ta7HdkiQc7IdBsGxxc
	 wGk/b4JZZuCC1w/Tee8h8KrqkJ5nKMcNEmOINtHHFbpaQ/UFHYQILDf3MRqP0hqs7S7ig
	 p1Bos4fRiCD8V9TaNG5jWu4IfQ1WfqC12EHBKreQSj4EX8TSmAuKReNs9f7rpvBkR4w4f
	 KtvkahNX6hn/Gr606A8RRmnQ7sbv2lgD7ub9GPuKrJAHl85Mda0Z/K+ArJF2kP+FZij6i
	 +nMttyZ4UJvVBKA2OqiY0hVdq0LsvO6Wbff4El0oCz27PqR98JdzFx+imJZab2vd4cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=abQ4fK2r;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DAF606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DAF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=abQ4fK2r
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so3381145a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795556416; x=1796161216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sDRbsF0JGL+jAU1JBrFF1i/9HLwj+8h6ukbD4y/bsss=;
        b=abQ4fK2rbXJmMAwQeNswTuPnWJjR7JxP3glE2qU0dffifWlme3zN8rhj8rUUbvRwXf
         TAfWDA9NuzF0Pq5GnEK2DR64l41yN7yQw1rmPyLdzmsfbihv5BkZyNF0iUzw5bVFM797
         mFUZVHzB+NHWgoeen5Mbo+Jx6Dq4T27v04LrC8SzjvZjZ0OuxgZAfoGJatbpEoLLh2e1
         PhjcFm3plNH2MRsBmp9L8e/jdACxIx0T30b9MnJQpTIom0JC+EEwvv/rkljFdWDh5k+5
         /d9Aj9xE+sj2ZINUzwFrDvs1qPZyC/OBgmohOHwZDLsNAw/VPi2xA4v0r1CjX3v2Fx1W
         PKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556416; x=1796161216;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDRbsF0JGL+jAU1JBrFF1i/9HLwj+8h6ukbD4y/bsss=;
        b=eCrjlwd2hDqA4BScXeXPTvLU3XbB+qeV7vftkzFaGyEeA5Ly6GsbrGZbRFw/3mgHkq
         HpzM8jprohQyZzDQBwMM55yGp3y/z1SBqNw8D/1CI782GADr8p+AuAbcAk7hxpDMLK4H
         9517EnRJOFpGOMJKeeJYXs5GpT9KuOn++ozdDEQEGjRtCSVwfCx1Yq6goxqhOEPoGtYC
         j+xZjpEMXzWWlFaijWymAyKGisLTO0KfBeYMsBxydL65lvcoqIhT6F9uo5l4FD5pqIut
         gL/Ul+1KPmHx+nTF6xm2AgLcl8iIvhwN/WKbr99Mzaus+MzwQq0sWdlsrfu54EjU07+l
         AitQ==
X-Gm-Message-State: APuU4Z8ZiRE8QoPFSsWsxYoBThMeUxsJixcjA/dlDhDHqhVuMbnwc9OI
	1P2/H5cRxJZNuJoH6okzx9swWfprOicR4fkbWOVfUkav+2rviSssgO/bwwat3TqvJTvo4Xw6Wjj
	293MIHmI=
X-Gm-Gg: AZFdTZdF6R7SxpjHwYOQAP0jfFrGi0A7rtOFkoc6APBjKi1zAWFJ55HmurZyKzs8OO9
	LQp4UDRiqyYEwZeCZqkBGaJhBBTG3wBKFLKh+QRJMB4xnykJbzrJZJ+wYTlEzMNtM8osCuEKyEz
	uAY/zOeFm2bMH76Qe2QIo0anSEFTEvNQqwJb1qdo7Hjau8OMoLxu/WXXJKoLr3w/7NiHlvSp63o
	BNqeo+cnxOmQiIMe8HKiLoO0cyxEpe3l0sWWF8CxuoZQjEJwUzGZsANyCRRnIyU8UDiZBuiLtrl
	wtGHu48r4lc7SVQvSoMrACJTnRvKF4nHRVs1Dyn6nHJ7A7RFS98PhBlD8pRffIWQWeT3U9dlfxP
	GdU+YObuC6WI3GzSqjZSpIftdmLLAzrOmrOPa5Zq+Dzsv+GjaC/GgVkB4PvM9jXwUXyoflaOVWP
	0lXUsxNcYTz+FMOmc/JHBcJr2NhUXkyUaUOy5waPi1o014m8Hjcf5i59c103/t8JT8fDeWMIJQL
	GULk7HZ5XkbrCFhdzqyUreeHE2jf4CoeSnczDl+/y8H1zb/HUh82AN2TBdGwr7Z2Y/f0xkvTbaA
	/0XqxDzAhPe5kxHBpfOZKrSFE2d3MA8z0UXoT1+3wouGz7xZKu9An9PPDRe0Q5A+gg9lR4o=
X-Received: by 2002:a17:90b:240e:b0:3b4:f260:72d8 with SMTP id 98e67ed59e1d1-3b4f260760emr343882a91.58.1795556416280;
        Tue, 24 Nov 2026 13:40:16 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm11385684a91.1.2026.11.24.13.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:16 -0800 (PST)
Date: Tue, 24 Nov 2026 13:40:14 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Frank Dressler <frank@dressler.pro>
Cc: netdev@vger.kernel.org, dsahern@kernel.org
Subject: Re: [PATCH iproute2-next] ss: build the socket cookie with a single
 shift
Message-ID: <20261124134014.6999b835@phoenix.local>
In-Reply-To: <20261122033657.187703-1-frank@dressler.pro>
References: <20261122033657.187703-1-frank@dressler.pro>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Nov 2026 03:36:57 +0000
Frank Dressler <frank@dressler.pro> wrote:

> The split shift was necessary only while the code used unsigned long.
> 2e7e805d0aac ("ss: better 32bit support") changed it to unsigned long long.
> 
> Signed-off-by: Frank Dressler <frank@dressler.pro>
> ---
>  misc/ss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/misc/ss.c b/misc/ss.c
> index f4160f59b1ea..5107d42ac229 100644
> --- a/misc/ss.c
> +++ b/misc/ss.c
> @@ -795,7 +795,7 @@ next:
>  
>  static unsigned long long cookie_sk_get(const uint32_t *cookie)
>  {
> -	return (((unsigned long long)cookie[1] << 31) << 1) | cookie[0];
> +	return ((unsigned long long)cookie[1] << 32) | cookie[0];
>  }
>  
>  /* Names indexed by a value from the kernel, which may be out of range */
> 
> base-commit: 9eee7bb80f98a0789639ccdb0d68a667962e16d6


LGTM but I refactored ss into multiple files. So will need fix after rebase
