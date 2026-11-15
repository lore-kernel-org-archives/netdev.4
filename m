Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778482;
	b=X507RJdbDRPNmhSrkaAR1H3vfw5dlQ54xFhVO9GSB3yvhSVsMLp5z5YtjCLKY7B3vtM3
	 XziXDrqbqBmLkWQltlqPyiNnmpKpLgIfBKNszbLoNWft69oLtdHUt8tcwv/GIghQzqcLp
	 +h+YJWobu8d5gvBRl50byk0qTiVEVUF1mZX6HIUEhJxpxx5QIpS9+LoEa9bDrHclPjZcl
	 eEG8l2Q+5Q4MiX3cJ2pfhkpDTCcJw6mFUiIzeTRMmJwNPKTvWFy3SSzy9N+/hiUnlaQXs
	 eLv64SfKxngSbSH/deTKpGv1ORFTe8oelH3lnmUbMYHCkN5G1Yamdko42vKjKUGYwWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
	b=rMcG966Whlb/8XxAQa66vQ8MNxzBpeVNQEnpZ7KupllyCHXNWtAdUiK4gdkzlHJOBBbF
	 Ui3572BjC+L7YgzVfPLUV9c7kl1XvOWxPGrFpQNrolNBJjh9IBw4A1V4Q4NRQNOthn7UD
	 QP1Er4SQJSROOVhfi7Hm2rA42nNknGz3zQIQplt7qn779dW7HDkhWTAW4/oBDwbdPUdis
	 qyBxz/Ci4G7m8eX6xWkOhArccIQF97w8ukpDbRloM+1T+nQMiNRi3ejI6gF9VM+5wlO79
	 QT77S1RVlMk13n3+Ym8HhIROozSLER/58a49X5eH6x1XCqRn8PpvzqXb8sqaOEC2jgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LQb7bpGA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F8E606A330
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F8E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LQb7bpGA
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-85c1135c286so2838759a34.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778481; cv=none;
        d=google.com; s=arc-20260327;
        b=g9zZO/qPBTLeMjpZso/emEldPVOnmDsvvlJ//GjoutIISzJ2q7M4nx41FuccWboz61
         IXghtVdgebbvy3z1B7XZcfqG8+MeMv1tDo00EjNkCn93RK7HdH9Efx40uXFJph4XCazp
         d4dCWjY7HBbcEsxIb0NsdUawY1kPZ5rZ1u4+Fz3ak5Bw9PLIvm5jPgM9UwyHcObr87k6
         QKqq60xZ9MjB648N5er4V1+6FzsfnwlmAPj00uQ5yW1BW+XR3UbganJ13cLEYfn6PyhG
         Pg1Du2j0QOhBnRwh72rcj/ELEw9T0N7Jd9jfawGBboFmU5DkvEOKxBeSQmzj858Sd7yK
         x0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        fh=kojixtvBpjk/xRIaQ3//4I53+Uid43O4FaEW64nZ/IQ=;
        b=SxuASXiUdBg0Eb7/8OKCqyQq7SMq6WDxkb8MgOdJnPRDK4gUf4bA58ibmqL8cOpFTd
         owi/PoGKWGZOS1OgVMJCdIUEVctnf+jkn4xmYXaMJaf1GgtNrPDJkKUPQrmrRZ4SOKiN
         qm2VO/D1gW4V9GyWKPvCx73XaMGk7LzsKIIUStMw2ZtNP+83ss0AiuGtKgSdR63006oN
         P6uHmv5zwwR+P5migVzn5BU0pO/vlwO6FXM0fE3+w0Igg3sSNIAsXpe94O5TkstUPrut
         q8wsfX4MvrKipf6x7RIlOLtud/o6W51Aolh7prpqs26pXwlGka5/nrKUBwteRUxfzdKz
         c0uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794778481; x=1795383281; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        b=LQb7bpGA03szUtIQx3bHdBEh40GP6gIqmFccn3+VEv955kr1PLbIVOR0uUlP87lFx7
         4/Dra29lac4PuGRuM3R/yXVFBmgDTi6WO6vI85vAlw0n1V34Jf/hJpYsAkBnMRiQ6mqh
         V3GMoen874LPOwBhk897GpaUo6XfRFJm+vBswGdzMb2I2uQPn0fQN6MCPQCsjuKV7gfF
         2GSizdod0eYE/AaE3zaC/iLIkeED6WCx5HrEXxJh4s8Cvi4lLu6aOzwNQot2VdIdJN3y
         8Bx0WHoW4EgCtFvY1FZetZuaNHmmrlxLT56LB0/prybZyypsd1+ABS5X/os09adxvk+0
         glnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778481; x=1795383281;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        b=nEob8IgM9/NBIKOOWTW5335qneX/UPX5JCJXHu7/Qnu8d+vMwv+Uqh5IcdiQAnKxIa
         44SXEgH8zZb3M76ZzcPy81mAx4nzn0usOC7AwliTnovOC/HYo0sGHcRTzuVC+13lHGat
         aueIqUGX+7bNA9JZ/oUhBakMr13j61H4aRiX11rQzVhv7d5yO5UG+qOj2682LJR5YGAx
         EZQsdU3pGXmM02H93wbw6elYPtC5X+FvL6523tslWE2vSSCS2n3/GBeie3kGzK6sr7Ri
         u7GEqkT8kRmCu7k9xgbbrm685JKuyJfn6Lghtz0Ht0PC2Cs0Ir99QkSlHXTWYgw+IXMk
         njnQ==
X-Forwarded-Encrypted: i=1; AL+hErHbPHdsOyRDWHU9LLxmrz6GKwQ7MhtwYDQM2/cFlGsYHf9XSyON5D7ZIUk5IYGS0wx6SXTjn2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z884j3D9qJU07snWUin/u+TwiaXFGRIpVRnbWe4c5Yzf0nr9z8d
	WkNk3mIV/ODiN2a5F2PQbO3Rp3IBJRQKStfXniFIAEzGXNJq6IOGurzzuEfkVBkyfAYmdYj/2jK
	wPRqj6eTPa04bxwbjSJxFUzULV5mKOoojA/gKF3P7+A==
X-Gm-Gg: AYBFou1DtquvlFV3FaVYBsBPh2jDNt7++8scclyjAIL+vF30shn6TOSAxzKLjL9UimR
	MoqfoM1vplZj52XsNPb2QyBwrT6MqyjQrt1zVUnnL9q0f0NSoz6lA6LReHD6Govd/JsKcWgNybZ
	4N2U9A6X9MlB0b9pTrnQyfkXQjXVfd8/z/woL3OPDEAhV/9qp5/CxSI20mz06r/TlaNQuUzx1gt
	luwfWmBB5dFwPQ0UOMMmi7drMSnksOGQvh/+oOGftxhBk78oDSqiXXz70hyjmF+0eud89wJ9Pb5
	+EjFo+BmdoUVovpLGKWfAgrlGDwH/f8NvxqtFXmrVSDjEMZu7RiFWTKdKZEe3TNspyorVoXPqkp
	ujhzcfbalihff3pcB7aRnVbr/vXt3wdLRC+H3ll3tDCpLnZHS5VZrlEilyJjsSoqALhabOP4ljy
	73Zu9DkT3Nug==
X-Received: by 2002:a05:6820:3389:10b0:717:866:abde with SMTP id
 006d021491bc7-71ab50b64f8mr4048862eaf.50.1794778481265; Sun, 15 Nov 2026
 13:34:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115212117.48496-1-emmaonana18@gmail.com>
In-Reply-To: <20261115212117.48496-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Sun, 15 Nov 2026 21:34:29 +0000
X-Gm-Features: AclHuK-PPhL2FyJA0xoMqtYefnBbjo3uLjHDcDBJy-SQemPSC9ZW6IQWHZkbIBg
Message-ID: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
Subject: [PATCH] selftests: net: veth: propagate channel-check failures to
 exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 22:21:16 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Fixes: c017800af5c71 ("selftests: net: veth: test peer ndo-xmit after GRO toggle while down")

The Fixes tag should point to the commit that added chk_channels():

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")

c017800af5c7 did not change this helper. The bug is present since
v5.15.
