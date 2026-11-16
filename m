Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837903;
	b=qZuUmiaOxR9tECvH20w4bhl4iedN4HBG3Y/eCr3uMiN9HN0p+p+AkF9a80eXZRsAmkCQ
	 65ng67xg0tz96x4RCYi3umvt8Z0BXLHvUGAGfDrYEtz7kA2QEKrDokzQiYcZaT66f3A1P
	 coSeUBCXWQ5J/lhTKuKpL1OTAgAlYGPSeCYG+NgXjFKSuDVUI5Cmjzo+uFTv86KI4yv8R
	 Is97hMICY6tihR7zWJWb9ZxbU0H3YSzyV+kNbiCWLzGe+bbO1s0Zt7CvoyHOZarxilivx
	 pIlGw8xryzsgRhMhPy4S5lp67ap5NiBzd1wREu17U9ckEn3eXif+XO8QDHcOBwoR9Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
	b=xgwxztS8X6L44rtUaRw8mj2FOYGSCgpWMLRE9wsffxtE42BPhOAd7p78h2vbTnDR4Ld/
	 7hW9dNpusJf0MJQsYq/A2225WGDnuveW1N0acFbEuqeJtXvtsg+cVksfOlY0jlDAj0RJV
	 A6TBAXF90N03TxbVIyhxhfFO69WeoexDGSyTB5XUw59YGCmMhLNGXIvqBWRo7irCliPmg
	 tPGhl5InO0JFObnlF8XgWa61nZvHjKCkBb9tAViFZCQR7TLcPGtuIMZkJPPa7Ox3Zp0IA
	 GOQ3fb/w+Atzs0UFuvkzaaa9aPcF2MOxBO1W8uvA3na+/GOvAp/vB2ReF6hKtpCcjjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="RDRD/OcL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E3606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=RDRD/OcL
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71adbbf09d8so1341829eaf.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794837902; cv=none;
        d=google.com; s=arc-20260327;
        b=Xbms10TQbJRJ7G5Le+GEkqdwqq/dvNxZjEx5SgCKVHKtkp+FVcZ3iKpCU5KqvPPNq/
         JtAZGVKhPGXHg1B7+OYDde1rQP9xy857bs4tVhbEN8z4KaDBI+O2vOJt78GeSq7CGE1S
         UR1GqGG1yqjXZ2bCPC3AnVdNDR1wPnbDcFUdJKr9Mn8aCfT/kCajL+JaYNv3VYPT2JZw
         iPOjDLw/haTof0O1ZYyoX3+9nnKu8LCNtt70L0vgSHOeYOTug9zczgODITjwJC/bvLrC
         BQzKJQi++72p0IIf6K9ilrP0RF08rtsjP/jCqDlMe3qa2L5CXdtpEHMAK+3qdTnZLdCr
         AKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        fh=MJLjA3W/MczfCyBaz2PidY+rwanq1e9/CdyiYyR/5oA=;
        b=WkQgC0xLaiNAj4m974RmxhbIHwDhNeEF5u+HVv6am2oOf3Ew0DvJo7AA4/uWZ+M/JD
         g9Puv+4tQSGCh/2T0Ym8GCltTK35D5s93Ca/aGwjaHc00nbnQbFixRtpNXLqgLYcv7ge
         GSB0XEVhDJCIvA+CGTJHI0Q8/W4UBl4zJ/K+2qnBQErjS8wLfidiqzJuHrE/HfdcwJdS
         fmodAn5OTDqux41nikg1S88M20ovThWXHp+/NufxQ1Qr45mWBnA81LsHOlC18MW6adv9
         M+mHGFRaEdYxR+739XUDV6rZxBXsTSJnIiizZOHhml8rCk5JQf0EmALfHyODogBRW+pR
         inCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794837902; x=1795442702; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        b=RDRD/OcLdIq6BBPMomGGzPawAcj++fY9/uI9T/1dA72dsAu8agY8Cu6695ALuLwM0n
         8y09N3w3OnPRYtLA+0e+4U9RcOnky1LhgUOxXzhjjfWtcgZu2/11KvN+/ArJuO0D3/uL
         AyPFayZijP6GzDPeUrJPAizS+wLTSC4SmUVsvfBY1Ile6aaQ9CPg/kv99IdzqKSiLgcp
         KkL/sqlkUbnuggAYKTgRgmfPG3aEwE4AOQ8e2We0/RHTjfPWdEnjmhtf16f6MefhQPs8
         wjXI5xul/QtA/M+DzPqpAjwMvOpyB7m+LDtVfZ6yuRFcXnnU7LE7HpmL5egmcfFarZcf
         uaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837902; x=1795442702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IiIU9t/pme/D3WoLNwnnikBF+jtcauKxTw3ofmYpCiU=;
        b=ZgZJgK/wl+lg+kTDt1pu5yl3eZVbhuwY/IRFbGZ20YfiR54VgFKyqx1qJJQA8J4/op
         ihiNXQMt+k+ToDdL2pLuk+mnugd/nK8rzaBhaezZxVFgACPpwtHGGXoh/+SHT8XkCYI9
         T1kz/UtPYjF8XAl+UcG5RuL3WssA20TG33/lrErksUi/socvfn879UD4uqpkIMdGJEK5
         STJbw4Yh3JktBqiFsGGjbh594RzhCbBgcdFhIdGVX3iwQCmADRrsKJcKIxVJuxLJWpGg
         El+y5hS19fp6y9QVylrJBlVvXt+69eIqm4SCVFFyvRUBjOVLRw5nCU9R6M7YVRS/mm75
         LMxQ==
X-Forwarded-Encrypted: i=1; AL+hErHT+7pgy2/a36TOomT2a+aEcsRA3iOu9IwmrJp9uGvgMbS67mNwFc8VWcXtl4X0d0H8rpbPzH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cFjKWinP1ppOig8wcPB8r7V14lPWhN5KsAxxQG1OUdjuhyvwS
	7yPkm0iJ/fwxJWTkjw9JawfRib4/P+938lgXSmWvFkkePSF4vnvLG9HhVemZeH9c7ZYmnl/w24x
	1UzN8LXd5gneGXXjMB5wPF9oFMMdlr02HHv0MjVZMsg==
X-Gm-Gg: AYBFou3bmdFXktxSXW+8U495i4IwUf3tVaYtvmlK+yfMjm59w/OkRlOwi/KmUjxGLX/
	aQ7Qod86bDuPOfWG6/wHO9JW+MFGfvhQ6DIF4Y6CvnDVVuVSmVvwYrQEXZSw1xqO5LGtiCymt6y
	H3qQar30sxKNA31kA96iZQz1kfHddynHWIvhYTHarW8amGgTOmbs/HSUPF1qbrMYv3klCVwXl1l
	2NiwlSxjVo34oDw5Xctt7g17cw/wAxGDa2Z/P5fPLKtP/Lqru+JoB4gH4qR0c7yvRp+6C9y4S8P
	wZyE4A5nNLzZ3EAWTWcX0kqrC2ieio3jW8FU1Kk0wvDMSE8zCO6QuBu30Fv+XKvbqNgv+ecmGBk
	+noNo+PrBzp3OwsiB5LRiPIznY1362+848O2l2VN/g1rCBETynPhnjS0IKyPVuVSAz70tXygRa+
	1yG/9RjNpvLAEnUkKN67hFDlNlyQe0teo=
X-Received: by 2002:a05:6820:7093:10b0:71a:ea6a:4f51 with SMTP id
 006d021491bc7-71aea6a5809mr1437630eaf.14.1794837902102; Mon, 16 Nov 2026
 06:05:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com> <20261116084107.6675-3-emmaonana18@gmail.com>
In-Reply-To: <20261116084107.6675-3-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 14:04:50 +0000
X-Gm-Features: Aa3M54qRdeOnU1gJ7x3s56OW-hJCPdbvkrK8BlxFfQsIh19-OFAy7vmiVdSA8Lw
Message-ID: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftests: net: veth: propagate bad-settings
 check failures to exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 09:41:07 +0100 Omokefe Emmanuel Onanaroghene wrote:
> -             echo "fail - set operation successful ?!?" || echo " ok "
> +             { echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "

Two small suggestions:

1. These lines are 85 columns wide, over the 80-column limit.
2. The style is inconsistent with the rest of the file. Other checks
   use if/else instead of a "cmd && { ...; } || ..." chain.

Cheers,
Tianyi
