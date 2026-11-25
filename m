Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635944;
	b=pmO+FG0zFyBleeppjAzy/kmznwbAD8t8EL8D2ptPTD1YUTsQABwV8gWuSeuZHE2wLxMF
	 1vlTkPAZ+nf+HtiEgI2CTqqadxQe53aHab0yAFYO33N7gEFKpmAcppOwqjLhdzECoHBrP
	 Llwil5r8VclMk4sGvuczQ9BU+CImprecGoIalVStJSuobm3+F5hhP/2L36zfrTHRNZI/0
	 0sI1JpiVfYDeMJlOjxBAd1BRfLK9eJXPVclFjU0hR1oW+W+eJ9QITi91X0mR8usuGKbXC
	 7H9HB8v1oilhg0q5bHsTJ4mu4BmgzJSMMzx+w2dKX6TCpnAdjjlxGA0X0M/Tsc48S5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hFd6xvy0hW/uykhyNQpUH9l2XFVSW+p2LbIu+VEJclY=;
	b=qaBWW2uaksArrRxRGHR2w6Ok7x4eOrqGwcgRkljdTOUaBANtqCq73A+Z+jdDZGg2tdr+
	 YpeT62gICVdlvgtYFipZDWK1KxTVCMaldolobIn+ulWo1LvmThihX84vMFTp0jrl4kojy
	 H0Daaw8jjkwLJfA9eVztGdb+uSfG+1SHBTILYLGR61AEaPOhhSe6/SYj7IkMiDGGvfuCX
	 heX/IVpHnwq4vtrKNWK0OOLWqJE8yGyhQTVNDfHHD2UX3mAsNWKTbOdLWnVP4JwsVevWO
	 Gw3xAd9Q+kpJuhUrJGSwwpQ0Q+svPnR15Jn8AsFjYteJgYKJx8qp0GvcYfvBFtWiHFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=cy44b9Al;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6F7606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6F7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=cy44b9Al
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869f03af6aso5394833eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795635938; x=1796240738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFd6xvy0hW/uykhyNQpUH9l2XFVSW+p2LbIu+VEJclY=;
        b=cy44b9AlmneDmpHr/wymeRnnlTOofyaqYzeT7NgyNbvpSwOALzn661/w4m7F4lnjTe
         8qO+lLe0IeNgK5ix32aVb1mmXkZGzllW0lrdNnwxqzYL3yB2DCEHteUDBwWPJxSAAcuZ
         ml+yYK1ZOq7jsX6fsZLhkeoZC1DNHWuYGJlCu948rL/I27WU+PeBfn0bZxg0JANtSF5Z
         H9RYvMMoQwnFukucOFr4A77vT0p/H21sv/J4OOypIiRl9iPOgzqCj5UmI3SFVWOMDCeJ
         lkVSWhlw/hXemh7SyQ1cWEhAaiKxubKoje/ZIjjHtXiH2EyXAERRWODqYGAwrkYLJvHT
         V4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635938; x=1796240738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFd6xvy0hW/uykhyNQpUH9l2XFVSW+p2LbIu+VEJclY=;
        b=EymksgQu4MsVGM/2ZYsEWENP19MsBcp2OkgUxnyiEseyUfGlqy/U1b5/l/dxJ2zPXW
         6p5Qd8393S0E/xYvqQHMdiSmtNhCxe1QaB+e/nNHamHy5Jpd4W0bTMn3vLQ9gYy4iU+V
         RwcTNkkeJck6kFILTl+32860JYkVF/h06cWBQi1we59wTTIl1BMg1gydQcM8Pnmgi/JF
         51pZaW3ybXPhf2yCpdRy5BoHTzsVzAQLDhjDlabQgyIWGPtpcCEiGztn3m3Tey1BOhPt
         7428OqnzgXm6C229JdKmTq7nEocukmyOGOuJrKElUoKxSMxJNt/Jr6n/MlezwTu7kb37
         V1og==
X-Forwarded-Encrypted: i=1; AL+hErH4+XtVX0SMLhBmGuEToZ9LMc/X1XOWt/FOjBrzLKQgP1zgrmFYQDW5IOqj/UVd7+IX69wBncI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ga6QhrBaeq0bkLY+KewLHFkO7CWQvzTIOk83P1IYOz3l6n43P
	ChE5Pd4qbUewNN04SROuWoLiVzjyU/AsUzahR89ZHj2nqvitiYDZqt0hXoJpSnGgcwI=
X-Gm-Gg: AZFdTZc34M25clLmiH2BA0cm+8i92CO+ye0nQY8s9sD/QhziUWVrQUe+SFlJuxdyGOu
	FcBmKiWxhg4f61MZDL6Jh5DMn5onVBIhRC3wxhx0CPlEmVPSSmaneutsp+tCaNp/5xjrGhoJ/3B
	zHN3p3FA80q/mfxX5XvOCFNqZOcUgxQTQXVYOiIOukoPz4Nwa7fc4GcbaHJWXD64O/pbs7RpyTW
	g3YejZweDtS1N65ouIRl+osIGTCOYnpKPsC83Z45uLlyXhQkUKNgAQCSPRL3pJTFS4VZZLiHlKf
	A12gy4hWaa1bgXDEvS/SBIQeZs0WdRy7wGjxNDJjsyE4Msi3Eot8OpRlc+vY4Qyw9JcvhozcB27
	NT48KG471PQrwPGxkh3DN263CYvY8oeaG8JMBomPi2xtZjumzGZY3zTrh2HLZT/raOAAl2A0FEe
	1jsYnpoWJ7tI1IRR2gelrLM2imKFT4ZVOmEdOYtkg0VGO1A/nJKD55EwtzSk1ytLMhhOH8//7wo
	sr7C8R/hlsnv7ISLYipsv1NFPPU0dRG1KLtOzy3TM9JHyLcOIm5zu2V3Pz3yMOuPlAF3HSo1yUR
	p03RdWUkqAm+tGjWyhCs5fV+70sG4LZ/e7kmKV33+mxzjSMVEefMh+yFg63arvLNf9nsqAULmhh
	HKoXeEXuBKAWMNxQfoOXHHi9sIw==
X-Received: by 2002:a05:693c:25cc:b0:369:f17d:efb with SMTP id 5a478bee46e88-384b3e77699mr28669992eec.10.1795635937926;
        Wed, 25 Nov 2026 11:45:37 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm3737730eec.2.2026.11.25.11.45.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:45:37 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	bird@lzu.edu.cn,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	n05ec@lzu.edu.cn,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	tomapufckgml@gmail.com,
	yifanwucs@gmail.com,
	ylong030@ucr.edu,
	yuantan098@gmail.com
Subject: [PATCH 6.18.y 0/2] 8021q: reclaim cleared egress QoS mappings
Date: Wed, 25 Nov 2026 14:45:32 -0500
Message-ID: <20261125194534.52951-1-artem@trailofbits.com>
In-Reply-To: <2026050408-ideology-liftoff-aa01@gregkh>
References: <2026050408-ideology-liftoff-aa01@gregkh>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Please apply these two patches to 6.18.y. Together they fix
CVE-2026-46153.

Patch 2 (upstream 7dddc74af369) deletes cleared egress QoS mappings
instead of keeping them as tombstones that accumulate until the device
is torn down. It depends on patch 1 (upstream fc69decc811b), which makes
the mapping lists RCU-protected so that a node can be unlinked safely.

The May 4 notice in this thread reported that 7dddc74af369 failed to
apply to 6.18.y; its prerequisite fc69decc811b had not been queued. Both
patches differ from upstream only in one context line, because 6.18.y
predates the kmalloc_obj() conversion.

Both commits are in 7.0.7 and in mainline since 7.1. 6.12.y and older
stable series lack them as well; this request covers only 6.18.y.

Compiled net/8021q/vlan_dev.o, net/8021q/vlan_netlink.o and
net/8021q/vlanproc.o with CONFIG_WERROR=y on 6.18.65 from a cumulative
x86_64 tree, with and without the current queue-6.18 patches. No kernel
boot or runtime test was performed.

An LLM was used to prepare these backports and to check applicability
and stable-queue history; I reviewed the result.

Thanks,
Artem Dinaburg
