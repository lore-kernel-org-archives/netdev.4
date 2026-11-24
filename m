Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556440;
	b=Wh+Bur44w5JP/mLGpPzmKUe1ybqL8a7aM4IKD2fJLDNlP3vL2Ag2ZTKPSRFLpKx5tR+I
	 eZLhEUR+ta3PzqLXE4jCXwB4bAghlflhVDyWtmg9Q2TGgzQgS5XDE2uwH1w20O+0NCVQN
	 7kUuJiu1hmyyjIfE8L17iSIA+aXsNLoK6YT1khYISlpCL4w4KvuVuvjkwFDgtLiF5UTwx
	 j38lpgBi0Frr728gjEWJZWTCBDq7MgNYmmqiHnPa8cawI6LmlMq1WDQ32BCnOq2F3lcuY
	 o1sq7uBkt9tuCZhnMYSc8bULNkp6gBsDbYBlOvzE3XWCCjQKkHR0yndQ+X8PYI09lxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
	b=XF9KPiWz2OJXYJM2bsBXH4rMNI7E5VYUq9FKiXSQiHZXqsRP/i38xnH/Ex6/0iBhGFmi
	 VTVRjWm9No02mmp32A3OQp0SOnCHLZW8rzQIz1EuqgBIZZG+VRfK9kpJsr97AIB5Le07D
	 Z3En0IMc9Miff14f078O67GQOe6a5x5mVGtEoFwe+qaou2/DBGD2sbmZ33v4yVDYeFM+0
	 yn39m4Uls8NXh5R79M1MtcF/UszP28SracOlLwce7AIk1pLuyo3mAwM2YhEqwU9Y7Ie/8
	 ysBTvzh9JAdsO3GrHcEmQXN/Y62cshw+eFtTq1Dgd1aRDXvF9wjBbs9S02ri/ghAjYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi8EGLvw;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1725606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1725606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mi8EGLvw
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso11556295e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556438; x=1796161238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
        b=Mi8EGLvwatR57ciZPnajH53XIycar73TLMvtuIgZrwr8o59gtggQQ12mCJ91lZsq8u
         hmGmFwVYMPA83aVk24Xo4veC+N8ONh3aWgqYZaZoz4Rhy9FAgEDUPPVsJmp8wl4GM3cL
         dZYyW2R8epRb2L0WJ3JORZ52Taa2NIbTM1aG9RIXISLhYWq6D6F+2jkiqBUz0rVeL33V
         gjPJBdJRd4sdJZwTjxdQxtzokdIxRo6OkKAQzVKfINPVLgmCW9YJ5dVdo9qV+ccr+sB9
         rAbO/DsbVfBFUSsTo1+IRd9DBn5E4y82XPqJYb6REWyfmJ46mh0zyH6v6LgS5tVwjcie
         fvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556438; x=1796161238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/eu3V3hH3gYq5N6oYxvKcGt2JCj5qQ6/XPw1INj0j8=;
        b=mBDpOM8GDQPG377/KEpVqZcgIcG2K9oOPQcVGT0zziHvfe1duTDMWe98QGOGFgrrnO
         OC+4u/v6ZqCIH5qPf17UoCF7GayIYmmuyfuWIaeRdvdUuLfs7wPn4hL/DAgnSZxuj8xb
         yF2iG55JThWPRj70VCmVt4J6GFrgUmMl6qu46g0M5AkzvCGonGYjATsslnJT7XvgrYVV
         ulmX5F7jH2m3C5+nj26y4FjGKl9ozFfMrtigWvZo0XRlQPjIrcPEgvbd8Gjzx9eY8dFr
         pOTxY7nKGpcTsuNeFd619/2vz9dKnyNoWgPy+ooV2bQngSTIHj7ItmSfjn/SteL4EMy+
         aCmQ==
X-Forwarded-Encrypted: i=1; AL+hErH8kPB7thWPf89jWpXwGer7kktvS8wJ1tBkgTwohD3+aPtN9pNOwcs4GNBLpR0tIlSeRp0+MD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o4ChKgiuXzJG/6fd+UQjkiaRnsYNsRqHjeXbqsI2S8ainC2Aq
	G1YVvo9+detG2y0VvyaeMCh6G/YGzSYyhXqZw9KE61bCM45IA61e+MFg
X-Gm-Gg: AZFdTZfNd7iOrLdmJP24diLMPqXNs9z83P+/KgxWl3rde35qRPGoxG3bxfnnHnmoe5c
	9byOiscjiHMGFxeUR3lOInELj4btPSn0zq2QEOZL0Ot2M7nww+e0EvXfKvWjJb1u/QQ3VpwtCEX
	A07Y6KyUslDHvH/b93ZZ1VL36sMaZGShHhV4GjL1WyFTHdxBggfL5BbRmT1Z7ex2MimPybALjd/
	/lq9R9QZqqJSM9tlrf7IaGpqPQxTn8aElaaoaJzScI4xaorSsgDLwKjVBdcxfENxSPeZPWraTRC
	RM6pIMnSqdFjX3PmYX3MKekYsozHWXtnMBdPOVn9F2yxLPqNyiSnMJ2EsLwwdVshC6WZCWnVk6y
	ZFUiRzhydLqqw5N08xo7FShHhW47FOg050SXSZPnsi0/QQTla3d7q28hcifKpnxhs1CtXQBzwBN
	7x750c4oDx263gj5o7i49msIIZzSlsFPKHMVhqZVHBy52EHReC3plLfxI88igX3oLHQ8dEYMMQK
	sms1Ay0P1rP6aU5swbXRvZ0DoNyS1aKSMyU5JzJKEMV7WwIEuN/nlxda2tNt/5q//auvwtZd4CB
	vPnsE27kixEb3X5VsNwZg0G+bCBOLo4nfHlsLIdHB1reVo8cByaNVJcajCY1wi4dHQrlEaKVEL3
	JhDbFgTeenYvKSA==
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr239453505e9.1.1795556438029;
        Tue, 24 Nov 2026 13:40:38 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:37 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v7 0/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:40:23 +0100
Message-ID: <20261124214025.11603-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once the propagation patch makes failures honest.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v7:
  - Fix [1/2] subject numbering, lost in v6's send
v6: https://lore.kernel.org/all/20261124211645.5751-1-emmaonana18@gmail.com/
  - Squash the two propagation patches into one  and add
    Tianyi's tags.
v5: https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate check failures to exit status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0
