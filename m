Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434137;
	b=hZsSRXJXfndLyrdW9Hl+SWo9GWNstFhVbHLGXqdzbu0hVCF7G5RMXoZCC7laTyVD47Il
	 KlleEO7+WOFYyb8a3dC02LXUYMFwNz4Y11u3U2Mo9i9g8GZlsmMyhZC515UEfJzjU/5+a
	 klZAKBMcrn5bmdqMzJZVN9YIR+tUV2iuufPeSMokX+KV78yepbBdoJLsyjffM39Y5TNE5
	 PcfWhzwiZSz5wpScXRA8VUbv2pOzYQMoIfxkKNujJgqVaLtwK19TJt0uARlxmF6hRpAyN
	 4XoRtCcOpi5rLJgKeXp5WmPeRntAGifJ+oGnt0NwdpjHLjzV56Iqf2zm6IVHkYOjBRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ir6z+1QO+ZehukLrcRk3cS0RS9cUAR81T7iwjbCFauE=;
	b=oXFbK5O1mDpzR1//jM6/iYEMemhpgtLM4Mg40nOMaX+o66gemaFv8VPdQyMt7p96T3+y
	 kaaIhlgxflLa7Da2r8xvo67LlQZJh8F4MArdZSvFCxwiEmwapzVtzkJOHjeOWi0U0bwM7
	 F/PZDYfhHVwQ0TF60wGUNRMc4QQ5GP0CRptrN6FdSeYcUK74DC4QldWlNnyyZk4BAG1YF
	 Uy3nGa5sbI8Y4MqQ3ecw7VNWd1W4iDTmRydK6/12IHo/hdkqiTscf3HQzrMIPn6oSjnyV
	 TbjBWe2gqgq0okXMdXJbGGvemL21ARVEP2jDLPm2wM68S0rsXfPqIeFVtU5ozKpEXcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJCbp4Bz;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB4606A32E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58AB4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJCbp4Bz
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so29624645e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434136; x=1796038936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir6z+1QO+ZehukLrcRk3cS0RS9cUAR81T7iwjbCFauE=;
        b=UJCbp4Bzy1ZHHz/xeg0gqvcKdeVezUb6m0Mo8hJL273XKnukNrQq6GOFSTmBAcjtIX
         s2GCR8GWmHxvC5uOozGY8scUgUfrOwY3kE8bhlboNv5IqSm5yui9SXAymUYKwiGcRWsc
         J6LYhl6L51UcZv8m0kzMHi2MsoLzuS5JL4Q8P/lj4Rh3rfIv7+JUU/zYEdDe7S8tuMXl
         PwVs2ncrraM02QiyFfnunkB4h88mWWkhFQvqLR1D37opDahhfF+iYWsTYetkcqzCG9ns
         U/19A+I4PiRujN03OKyHf9g+Dfcld0t9JK8l+ZULcO/dMujm4FM8SkQE5BXk1aj/U6r3
         8PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434136; x=1796038936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ir6z+1QO+ZehukLrcRk3cS0RS9cUAR81T7iwjbCFauE=;
        b=KNHaPojIBmVni2/XSZ0tan3qekwHQxhLLSk1qa8vyXw5VjLWoiqimPrUMowwUiV/B2
         URR5eYADqFjAY4xOP1KDaW4wS+v5HiG/zg+nejIy655wtJO4F/9uT22uDsX2VeG2tWem
         0kF9SJeRZC0T7UcJdth8kzGFukd12ZY7eY/0PMwUiWszzTqVMitcPM9dRVRn9whwHWs1
         HTqY4wBjOICU3jJrvVgy/IXqfEpP0k9QIMVxgchhG15UEw1BnEmakIcBqFwEovrypJ0J
         cy/2l90eJqy76/FRlic4ERhG6VypFzPKB7vihfzkfTLoYmfOujrWdBI0RrdkG5XQ10x/
         6nLg==
X-Gm-Message-State: APuU4Z+YzNmOC5NK+y9foTV+MsBkmlV7mZOYTT/yM4oQ/WRosrqGUom/
	8efCzHDFsG66OfjNHFzAVFfDdOnBQUsLFPvlaGjRmi0qPHQfG0+TnFwf
X-Gm-Gg: AZFdTZdZLIj/gKQfkZbZ1eZn5tOcK1ryK/3K1fi+9x8jdPtjEjzoOswRqzUq+pNgUKc
	xFuQ83y3IY4wvaVd+21Mdj3CB+LzeOUOlRkU5kAi1oJabfawMKUJc1BBEr22gPlHqrngA+TgGLc
	+UH1jW5c5rtXybutZrQc8/Br5CTe16JerW7eXBM13IBVKGwLGBxRDZFMB6TIw+0UBhHtlnzEuCT
	AsHdSDFlrtlEpZSIzzNYetnrX3aC0A5GdvEPjv2dXvJFA9+neld/1LWTdVsWsf4QHzDYNKrdlAL
	4q6tyq5K3R9n1NtHEt9ceCs72p9igROClPByC/XILF22qR1ctAf8ZM0JPgIKwRvQZrmWxGZ/bNx
	o5wsxDn9liJyz1aehRWC13wMsWVC5HfsAl05X2dd4xgB4OiGskY+erAERNTrXd9ZZjxFN+7Ju1l
	4iPaqvLN7CtwF5QEHPM6Hxi1KIQsHTPuWRiYx7dI5q7S1Rb8f+AUyTX/9Behfn/fDigQQOH7Ob9
	9tmvObpmESnn/59UQFZOntFdBe7bYZjYDk4hlpSVN+nh2f1Bd0RtBlnt6Ozg+2Id7afLbHJAAsP
	g6nRNQjT/poqj62oAeoGz3jxP096h+rNW5xalrkC6w==
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr215608255e9.33.1795434135562;
        Mon, 23 Nov 2026 03:42:15 -0800 (PST)
Received: from localhost.localdomain ([102.187.134.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm351369625e9.1.2026.11.23.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:42:15 -0800 (PST)
From: Mohamed Dawod <mhm.dawod@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ye.zh-yuan@socionext.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Mon, 23 Nov 2026 13:42:08 +0200
Message-Id: <20261123114208.2112278-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119053357.2033707-1-mhm.dawod@gmail.com>
References: <20261119053357.2033707-1-mhm.dawod@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

Regarding the two additional findings:

Both issues concerning the signed 64-bit rate conversions in cbs_change() and cbs_set_port_rate() are already addressed by a separate patch series submitted by Jack Wang:

[PATCH net v3] net/sched: cbs: perform rate conversions in signed 64-bit arithmetic
https://lore.kernel.org/netdev/

My patch addresses a separate issue in cbs_dequeue_soft(), where the multiplication of len by NSEC_PER_SEC overflows on 32-bit architectures, resulting in an incorrect packet transmission-time estimate.

I intend to keep these fixes separate to avoid duplicating the changes already covered by Jack Wang's patch series.
