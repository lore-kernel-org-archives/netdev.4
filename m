Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436153;
	b=KdwoxJedw9l6eKaBHtNPFkMrMsDVWwU9rZKA4hysxhEwuP2KRszJ1SXl5iRfEwqzU/l8
	 q8OEnHvrNamwEYnT7It79MIxNEkplwIWVyxCpwlDcuTjHPL9HTEKt3ZhJ0AT8r4BEUKlA
	 MfaCtwz5F7oVwC/SumacL77X4/3eRWBHSlQBm290LB0KxPJct1kxCIaD6/dno6Q6PFREE
	 SFdx5x0pRIpct/NmWTsXBPWRuO11xm22Amj+H1KoJZSlMZ7xOErvj6JjSbH4b4Ihuq1mm
	 98pg93/Ls8LaBaSyl1QviSj8Tv1uFal3goAAaWJty0QHAxtLB0Bfmvo/cN76QAAY4iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8jk8/lTikrKaWneRtmXjwH328v4u5+a7u543uK0spzc=;
	b=wN3ITHJnSavXEOuj6DxxAAbtpUHn7RXir5n4/beDrm6aaRm9vw1B/9QAu9v1Fa+biG1G
	 t2j8p+25O2y038+viONDkqgre3xQqS9Bven1g6pMAG7Whajg8tMveiXl2B3iT1LGoAqwN
	 H00ajp3jo+ta/Jk8lgPXfxTAmbYeSWV3ZUwMgaTmuev0IYTF8r2qXn2YgpbZEg49CyUfX
	 nP5EcfdUlBTwHJMJjzQbKetNbM9m8/2V8WivB4e/eEnl87Q9y+dQ/ay8P4rU1u9aDVOEs
	 tbZuHrqcfCKoX8YtXd1n1qJhbwolenAB1ufOPJMSgF5MuR+48TD0Wshu/BKm0v97LBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvJjDiST;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F63606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F63606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvJjDiST
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso23628215e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436151; x=1796040951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jk8/lTikrKaWneRtmXjwH328v4u5+a7u543uK0spzc=;
        b=fvJjDiSTwTAsXhI753fJVkY1MBn1pUvJ0gJuurvjw0KQgCZ9IckfQTuAmmCSGiMNX/
         UPEuyDjvoRrXjd6mqHrINIcD07l32C20iZKkT8ug8ERpgNx0VRAXL9gs0iYoR01bXNVi
         bpkq3azTee/na4BrvTNyeLio0RqUd9VHjj8rGLkkSEuQjUb6UXOO8KIxMAGHHCk147II
         IaxX5cHmXu6bZp9OWaW73pmHThnDCHfbay5+352W0lV/eE/K+NwYlMb9qvf2Q9nS9HA8
         E+pcLOS2063hbQwW0bGoOOy8GZ8Y2NL2M6/QksSunGfTrEod7Eqnsc7+zp59BUwKoCnC
         qc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436151; x=1796040951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jk8/lTikrKaWneRtmXjwH328v4u5+a7u543uK0spzc=;
        b=zh2rBYe7UCXKzhvWWZpSA3sIeeFuuIH2LcSveKGo2/nOHiE8ubA2t5lqWxuKPeRn/+
         oG7OfHxd6kE240/5LDCRyMq6tyv19ibUSH667Ry+Tk2Hs96ViYWwfacjoRibn99E+Mta
         plNwOpfoR1PgzKlmw735bPge84gOqJzLezojBVVmo2+ZsJfyVbocxR6fP1RBpDRx+nkk
         WNkIEhQGC4TsM1cpNIvPMjN1sql1i221N/Cs+TsH1hcaLfoxKRubudufbzaLZKS3KvuA
         34//e2wLxNQPHAWDoKO2Aw//g8euLORB89ap/FBC6owa5dB1BqxhEHbAfJJgTL0TAjtF
         JFhQ==
X-Gm-Message-State: APuU4Z9NjypJafc9d7y1bezZmCF8gIdZn7coGXLT/hx72ftesJikL4e6
	Xy6ZVfbKkytaw4MvAAkedbWFfK4uKOmkaJowvtCzBGko2epOMP567YRw
X-Gm-Gg: AZFdTZc4mVPkeni5I0Dg6si/eo8oWpMSN1e8uZd1w+gIFOH4dqGPXgbZ3SbdCwufixE
	opHAlzxtjQ2YU2/K75lXxNsfpYfPel4Hl6q+aIpZK56KpGqOIc0+s/urKMxpvOrdRcd8L1hKRII
	53jYZtuhswRT1j29S4wCwgAHHe2hZfEgZLka41LvRPcqu+NyQli362KLBR24Zlszbp8yebE8hL3
	lWccDcjH4FXoVIAzsTgxHrQXh89VZxVL/tGHl9lwnpt7XUhbUpb9cVWCpddjqcyF04cTwyJZYm6
	sa/fXG8rvAZyBPraHHG6I6hLRDfFosl6IJqj1ceSbky632B8V7RHpQTui10Wrzj+/eX8BVcX3q3
	sZswftAb/CatcnaLNbbevGPanfEbgC4J/IvIzqgCHJaRteDGu47obihy6hnDdBFb/yFtfo8QXMC
	tvWTV2TamhgFDsodmm+iIiCb0EsQ8tKnEtuPMSHRJ4mZEJ5wKPKBsvt4fcxRj9Rfuz+Db3Ul5Nx
	Eoxy37mvgXVzZwdZwt4Vjw8cIkGwz7zBmxdluh8ZuWWpVH9MN3DmWklFsna+Jo4Fz67gLHxXyWa
	PjGWuMQeOSzFn1ZbZJR2bPYstn+J3HT2Uh33SXfd62zCTsl82yWCth/k8J/uAmM=
X-Received: by 2002:a05:600c:6218:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4bb887c341dmr250840055e9.1.1795436151318;
        Mon, 23 Nov 2026 04:15:51 -0800 (PST)
Received: from localhost.localdomain ([102.187.134.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm408975775e9.11.2026.11.23.04.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:15:50 -0800 (PST)
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
Subject: Re: [PATCH net v2] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Mon, 23 Nov 2026 14:15:13 +0200
Message-Id: <20261123121513.2112743-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261122064155.2094434-1-mhm.dawod@gmail.com>
References: <20261122064155.2094434-1-mhm.dawod@gmail.com>
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

I agree with the concern that my patch alone does not guarantee idleslope-limited throughput on 32-bit kernels affected by the signed/unsigned rate-conversion issue.

However, this is a separate issue that is already addressed by Jack Wang's patch series:

[PATCH net v3] net/sched: cbs: perform rate conversions in signed 64-bit arithmetic

https://lkml.iu.edu/2608.1/09680.html

My patch fixes the overflow in the transmission-time calculation in cbs_dequeue_soft(), while Jack's patch fixes the rate conversions in cbs_change() and cbs_set_port_rate().

Both fixes are needed for correct software CBS operation on affected 32-bit kernels.

I believe these changes should be integrated in the appropriate order, with the rate-conversion fix applied before my patch, so that the complete CBS functionality is restored.
