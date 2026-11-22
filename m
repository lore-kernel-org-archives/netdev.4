Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343010;
	b=o9yCtQFIOXfkvjfOi1npeJqWA4o96lOzYcnGloRuBq+XZNY7CqVL7lAiQ7A7Cao7Dv61
	 KkQRIJJA7Rwx7JWSI92hljX26w/wwXQG8gCCgxz8v194kvlRDe08d+rWQT/Oz3XTknuJ7
	 GzGXPRmBymPf9cCl2Q0y9GzzyWuM34ffrVhdXIfr/2F/iQ0LQ1V90Ni7IRVg+RXe2I3Q9
	 qZGzvYlKw7aLwas3jeZztZ6WurwMuxk4gPigMxuAohfpaluDUplwONAFisqeahF/+zutE
	 krQLpWC1/90hrDOVQRaiMN5a9SspspFk2Fs2VSyFl8EcaPibZ5eZhlzIGJsEL/0pvug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DS50kc0yp+XKmRK7kU59nKs7lLs5n+2L5Ptw9GISEyg=;
	b=BRwDL0ogpAN2xubu6Gx3Cw9gV9KfakbaxfimEaHgA81wJH6Wcpd7a3UfRVG8ne59UxHT
	 a/3jUrJsnZ7ExOmBjqS/MFOFfE4vZpZoHeQWckuCl001kuQ+yvojhDkQ0RK3Yl+WijOQB
	 693DBDSOPDOh9W1shYPP3cOTcYyzvieygwigL+hVGFaFwxwzAUgWhZn0yncR2kkkvdPzo
	 QsKSnlkbbvYRVqPOQW+k2KgeQOvvWXxIsjPB1UkMBlkqJ7c/K+avAAv6H/D5fMINd3h1j
	 dZH1MrFNaQXSMbdoVsnQ4kNg5RCNZ5K+G5vLSPir8qaAI5sxtAf0xSMW7m9TlPG08iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GqgcbTlK;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7751606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 10:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7751606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GqgcbTlK
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a9be758734so1350295f8f.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 02:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795343008; x=1795947808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS50kc0yp+XKmRK7kU59nKs7lLs5n+2L5Ptw9GISEyg=;
        b=GqgcbTlKvhpVEdUHeAMatFpKIA/KSipQ62eUBmYCa1HlHWCsdzKAIuUzKhnNCrf8mE
         8fQdsYR7Y4gflNAIsEkkfCTjAWfuw03vPALHREgkd/qRQ6w/rRUIUJd91kGzAhdxFbyE
         Xw3/QtaT1HM/hVLb0j3DF3dU/o6V6EU95rRd8nd7z5snYesZ3kzyjsipCiBU3j9O9q/h
         osjwBD6tXgWtSlYL3hqYPweMQHu6+iZ4tQL6t7YaA5tckbAFc8RTe04D7n52RUAqH667
         WhTSE6omeCBCcK2kublsmKM1oc3EGzjtlraVXau6bMvagWU7belt6twZDqaZ5ef4gliE
         PJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343008; x=1795947808;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS50kc0yp+XKmRK7kU59nKs7lLs5n+2L5Ptw9GISEyg=;
        b=XyLQup0okbIA2R2qx6p+r97NBZgcpE/HYuNJCMs7Af12uM+AaLSo+sMBccQp7oA3qd
         eSSUo+qdmJ6tLPHqf0qcZRapyBOqXiuxWkQ34soGVUhR3D7mSNgtdFGYi8CUtj218rM5
         fLb+25J2hxx1iK8umVv3hIKZRpuQMbPiGFkGCBS77A3AcBATr+QPz6SN6ZtfnmJHq2fP
         vV2dEQO1HeS56qSiYEfPqUQ/fmgklHV25yPfal5FcjhZ+I48Z49PSzkXsxvMPyc1glHu
         5ldO0OHvOYgmnXXT4QW0M9j7Fv/g51LbP720vAmyCD8pVRadt7PS7CU6+hycNcQ/r9Wa
         Nw8w==
X-Forwarded-Encrypted: i=1; AL+hErG2E4i2INEf8GzY34hYjQzLDRg7fj4F4iFyP2mkpFc/hF0cJaVW7kmV6QZE4Yb0wueuQXXop0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9oF1lvoCNnanNP7ZgC7oZCXno9Vj+ppwGK85ZY2OC9j8BEqtb
	bexhDXhgcaowoktWweFyA0JfkISno/DJhSGU2FLrQ02momVrdQ/IagHVbd+y7Btnan0=
X-Gm-Gg: AZFdTZdfpht1rmQHK56cHmtB8pVedZ1FPo/aptLirsZiHuYlTf9pRJ4FbeQVW/GoleM
	nyVOy8pjME4ekmwNawu6EdvS974gF7ANHCZVRPZyZc3POCn/qcHAxj5F1+EVv7iM4j389W9//HL
	QTTZ5JLP0VJ2sSSWx2tzYDM1A61+iVape5X7ENgvUFSr7ObpnaSRA65U0cRT5rsmzUdHAbxB4uo
	/HLMqR7uxV+Qar6LWNOlEinmL1CyKNBWuhEJh6482WKDpKr5LUVETVd9ewHDsDJR1DvYMKgEnci
	W6yPSCQTkLZXclSaj3sxdx5R9u1F77yYk3yQhkbJa2rACn9v0cwXDE3lZQefjc5Cu+ol8ALdVzp
	NOCzklhFvoKwNFX50y2+JPxm+9g5UL28G4/KfVYYPFEs9xcsvh/x4GGamYg1xtq7BQjqfOsEbfZ
	T5lCi+ue97gS3pxcQICGH2kae+GwzWybnyIOb2/Ll4fE1TlyiSDkKKdLQxScINjgQy+v2xOymRF
	3RAOqh9/xDLRKuXJ8X1LTIDvCEvzGlcTKSc0PTyW6PBclRpylS544dnCKCyhW6PGmCp4l56lnuv
	oUFwBHgeVTVXKheAIj9ySfezy40ZFFwshDMYE2anOPTYHkH+HAdzJIXAVx4=
X-Received: by 2002:a5d:5887:0:b0:4ac:84c:70df with SMTP id ffacd0b85a97d-4ac085bb48dmr15752832f8f.45.1795343007899;
        Sun, 22 Nov 2026 02:23:27 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm14830205f8f.25.2026.11.22.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 02:23:26 -0800 (PST)
Message-ID: <44b34f5f-742f-42eb-be7f-0cd731ff565c@blackwall.org>
Date: Sun, 22 Nov 2026 12:23:25 +0200
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
Subject: Re: [PATCH net 1/2] bridge: mcast: Fix source list rollback on
 failure
Content-Language: en-US, bg
To: Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, willemb@google.com, horms@kernel.org,
 dsahern@kernel.org, shuah@kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kyuwoncho18@gmail.com,
 stable@vger.kernel.org
References: <20261122072504.2623702-1-idosch@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261122072504.2623702-1-idosch@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 09:25, Ido Schimmel wrote:
> When the bridge fails to add or replace an MDB entry with a source list,
> br_mdb_add_group_srcs() rolls back the operation by looking up and
> deleting the source entries of all the sources that were already
> processed. This is wrong for two reasons.
> 
> First, with NLM_F_REPLACE, a source can appear more than once in the
> source list. Its source entry is deleted when rolling back one
> occurrence and the lookup fails for the other, triggering a
> WARN_ON_ONCE() [1].
> 
> Second, when replacing an existing entry fails, sources from the new
> source list that already existed before the replace are deleted together
> with their (S, G) entries instead of being kept.
> 
> Fix by marking source entries that were created by the current operation
> and only deleting them on failure.
> 
> [1]
> WARNING: net/bridge/br_mdb.c:901 at br_mdb_add_group_srcs+0x310/0x440, CPU#10: repro/304
> [...]
> RIP: 0010:br_mdb_add_group_srcs (net/bridge/br_mdb.c:901 (discriminator 2) net/bridge/br_mdb.c:924 (discriminator 2))
> [...]
> Call Trace:
>   <TASK>
>   br_mdb_add_group_star_g (net/bridge/br_mdb.c:1021)
>   br_mdb_add_group (net/bridge/br_mdb.c:1082)
>   br_mdb_add (net/bridge/br_mdb.c:1097 net/bridge/br_mdb.c:1360)
>   rtnl_mdb_add (net/core/rtnetlink.c:6925)
>   rtnetlink_rcv_msg (net/core/rtnetlink.c:7178)
>   [...]
> 
> Fixes: 61f2183512a7 ("bridge: mcast: Support replacement of MDB port group entries")
> Cc: stable@vger.kernel.org
> Reported-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> Closes: https://lore.kernel.org/netdev/179489219555.3099318.10297266282803881244@gmail.com/
> Signed-off-by: Ido Schimmel <idosch@nvidia.com>
> ---
>   net/bridge/br_mdb.c     | 29 ++++++++++++++---------------
>   net/bridge/br_private.h |  1 +
>   2 files changed, 15 insertions(+), 15 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

