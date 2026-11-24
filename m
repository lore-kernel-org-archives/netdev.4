Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515898;
	b=O3CqIYL/zhzNn+1UMnncQdzvSJghCTn2m7vbHwt3mM1psJL6fOuDCUY4sjtLE41Fzynq
	 FoMcgOGKFpSrw1xX1+04Ds5CkhQck5AA+LZznmjNsxe6InP3O2/HUcYpnwCuQo0yi4AaV
	 7xUSxoDMb/d24QbBUjeyyW9FfTUY3oP0asiFle2s1KwAtMU7uoByg5Hy8aaA7zzKg4q8S
	 iMEAqe0QOzidQNAqo1sbbD/bOzGh0a0NFKUv3oao1cwRmAaqPHHdsYO5j1SjpCFso88lM
	 IuV6f3sHt+9Zs7CmdXT5CZd8Gqn77u1wma3M2uzzlY0vS6HDmsSW1kmf3l4HmEqU4ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515898;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
	b=xrAcK1zxta/jt6aX2FYqEQA2xuiLB3ZCPSrBglw1d3k2Gb+3X/EemVzXK1fc0MOLS7Kp
	 Xy3MjnJ8iQ167d47nV4PB2g0+ZMJacxkm9Aupz9cO4cJPIqWvkTXVdnAo2OfAY+a59xk4
	 /ecJ4wbScFa7hEEosyVuobY1KrEq0mganSpxwE05F1V+uKrRisoNC35+4tjO0efzIzuav
	 F1BapsOGiRGWoahAEGco/05LdeLjK0+A3K/SoRlK4CNsUjOTVDdK6t69l9fUCny80C4mC
	 CLMsMY5Pehn2cs1b3++iRS1rbA6tKHRH5lzo66OVC3UcyhkqckHuTsi48kddwkJLGow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSMRrMR8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fXvxJAxn;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3651606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3651606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSMRrMR8;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fXvxJAxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795515897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
	b=ZSMRrMR8cu9zfuaJYuO6R6AA6oCuFnhkaOPqvQBI9pexqEyLfBQgFwUx0FNNZqLgi8TDNL
	sUIEhb7IKIZEzTBo4kLsZDmtWfbmRM+jB7XRS9PXq03pCmcwh7E20jlDhXdMxxwb4W1SyN
	Hv4UOx8nxv1DEiv4QHgdrrkIDqmANp4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-ZJP8-RhAN9iscZMke3zE1Q-1; Tue, 24 Nov 2026 10:24:54 +0000
X-MC-Unique: ZJP8-RhAN9iscZMke3zE1Q-1
X-Mimecast-MFC-AGG-ID: ZJP8-RhAN9iscZMke3zE1Q_1795515894
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb8da397aaso26641995e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795515893; x=1796120693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
        b=fXvxJAxnjpJafLUq4apNnhmL9JJUoCebglg6scGnwXO21ZpDmwRTf9BQK36Y5IJFYF
         2EgNyKX8+wGQoVxgJmWfADFh/cSdo0ebzr0PlhYuc7eh3d2Vym4JG40WE9ArqWHN09c/
         koWbonJ4lTD+pE/vuchRpQLhZ3CiF2QUM97PKgc5mrShzsVbBYR5SGRk6L196IkEd4ol
         rH3YUZbb6Z3lNm2aWVPVwWUgv3ZOtGSaqrH0vnp/R1dUiCjNOXjaKPKSjmqg5nr5qqhT
         OiLmxUDx5bgIYodrVteUud3o4OaKeoD7Uf7q7NmASeDMLVUHIy2VSYerDIQBjeWWIOWd
         RLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515893; x=1796120693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19SYUS/urZ0pN6WEr2EFT0U5X/oBT0AS1zyrFfZsqLM=;
        b=exiFbCRHrsUWZNxat3fvkxUxeeNV1FQifQD1l+QlxhQCf9vjT48N+UZ2TGHDnLF8cp
         SqanEfBdb5gjk3ot9EJIiEsztUQZ/eftDCogGv37patLmNZPaO5G+/CGBYlI6SeYJK5q
         a9FocjqGnWqy6DVdwEiZvL+yhCN74+fZBpoBwMcbu1mjhSrOaKADFQkwyjr0H3CK8NzD
         8HQjT9HWKW4y0baG8R6EgETc4r5HxNFLjnhLu0d2qj+qw8XJxTbfPAhpIp58qkKdF97/
         CEjENt5t5fU28n2YanE2AhlmVqERWU5X8V1L8dCqKc7ZcYy0zvyKfIkGiLBDyN9jBh9T
         kg4A==
X-Forwarded-Encrypted: i=1; AL+hErF1PMsd5K4i5HyTAhEt43Pg6Z8E5VUgaSw3SJipPVX3J58yHZk8rlntIGM/oUOJgGMY9ViwtsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2M3a3ZAbgf9b2H3jNcbbD4lSpzkfiN/ghB/RWYbJdXAsx1x+9
	hW033XvYmYyxCQr0y9DhEw9JduG9DC+xeFNq5ad//EkFJv6vkDSFRCdqwEUb79ErEJB+VOLFmUG
	P3QXRbv2EghX+yYQujVzmFTu6W06RSNg04ctlJq//z0jKpfHYszSslpANNA==
X-Gm-Gg: AZFdTZfrgoRho7Wa4opH1fixVrfMmqWwICsN2XqT6UEskyPSQhiLczARG553py7XNVQ
	YiGloEed8u1OLw66BHGkJN5vni9pbUYxwWyj05/fkd6E2c0mTxHRx7/r0wfDZOLbKsk9b7vjFxX
	hlGv5zuLfKa2fkbpAgKRWBiFLTWDDxiMYL/g+wST5IsnvI60MbkS/CKPBdeaLFLtO2r2azbeT6H
	WcP+0rSJBKwfzXZOAU8YHkh/ZE4GZSJRInQIWAM2Dm3WLjRJF7pwfJFPRLba67ddl+gLiJL0dmH
	VfpuNxffs7/56PNG83kQid6WmCW6WOC34QDBxPvYPa5Pg61rzTLRuI3I/JArWZ6sVntoZtB4fqh
	X6AZMOqGnKH+FzjcNgAFNUpz7H7loRTlvQ9UC1AcYmuKbYsdLjC+WVakBqTN1790/nhkfsBwA6w
	9Y34nEJ3mCbYD0Y9jOeAN52ZvK65tqJr9B0JmYxnEPsQ3G
X-Received: by 2002:a05:600c:4f53:b0:4bb:68cc:7b94 with SMTP id 5b1f17b1804b1-4bb8616516cmr379707355e9.18.1795515893651;
        Tue, 24 Nov 2026 02:24:53 -0800 (PST)
X-Received: by 2002:a05:600c:4f53:b0:4bb:68cc:7b94 with SMTP id 5b1f17b1804b1-4bb8616516cmr379706855e9.18.1795515893225;
        Tue, 24 Nov 2026 02:24:53 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm27252394f8f.51.2026.11.24.02.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:24:52 -0800 (PST)
Message-ID: <0a4e96b5-e3b6-49d9-b630-e7ff77abeaff@redhat.com>
Date: Tue, 24 Nov 2026 11:24:51 +0100
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
Subject: Re: [PATCH net v2] gve: mark the flow rule cache out of sync when a
 rule update fails
To: Zhao Li <enderaoelyther@gmail.com>,
 Joshua Washington <joshwash@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, Jordan Rhee
 <jordanrhee@google.com>, Ankit Garg <nktgrg@google.com>,
 Ziwei Xiao <ziweixiao@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Tim Hostetler <thostet@google.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Matt Olson <maolson@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119044537.57936-1-enderaoelyther@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119044537.57936-1-enderaoelyther@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 05:45, Zhao Li wrote:
> gve_adminq_configure_flow_rule() marks the flow rule cache out of sync
> only when the device accepts the command, although a failed add,
> delete or reset can leave the device state unknown.
> 
> gve_reset() sends the flow rule reset command from
> gve_teardown_control_plane_resources() and then frees and reallocates
> the cache buffers. If that command fails, the cache keeps its nonzero
> rule count and stays marked in sync, but its entries are now zeroed.
> gve_get_flow_rule_entry() then finds location 0 inside the cached range,
> since every zeroed entry has location 0, and reports an all-zero
> TCP/IPv4 rule that steers to queue 0, whatever the device holds at that
> location. Queries for other locations fall outside the cached range and
> read the rules from the device again.
> 
> Mark the cache out of sync whenever a flow rule command is attempted,
> so that the next query reads the rules from the device.
> 
> Found by an AI code review agent; not triggered. Compile-tested with W=1.
> 
> Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
> Suggested-by: Harshitha Ramamurthy <hramamurthy@google.com>
This is not 'net' material, applying to 'net-next'...

/P

