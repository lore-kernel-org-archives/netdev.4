Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085600;
	b=oA4j3VlX6djuOCmOBbzhdSRG1ev3OdbaemLpfcHIfn/feKBS/U+7sHeWO/8WUYPgoOum
	 aa+/7sPCd/KBdOdo7hUsizvFLuEz58FOApvQXeDpjoyxmA3zRI9+SEVVyouHFivMtWU+d
	 Im0DA/MkTEU2uUhDvrB2ubTzCca4JhDUNJqky3CP4hgbTbhQVwfeVv1HUwx5I1rrR7m87
	 EouKOV3cpFXGm7hlAgFmoZU/1l4ud3AbStdV3AivkkfNySNE567shY5awRrNg2U0Zc+vm
	 5qDIm1Cltbff9JtS4oFFC8xgPp1nB58RBm/I1ShfYva69XZfAIVwnEciamY+GmIf1LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hqE0DnzQVOaqly9+hSqhRUU82CqCbvfu1P534JABEUc=;
	b=tdtT588mOEqg16FAUhdiR/WNFBkhQ630AtKLDRX4BsKlUEbYJyczLBYdXQskN2ni+UFd
	 o7J12aEiA9/l5S/NAwjkvlAWifeZ08kKVRzhjPwdODSv1LB8yJ7L+NgehUBhbxaSbwIlO
	 I3K5MM7NDGxLeolnm+9BK5toSfS2ArQAzkrvaRwO5mt99mQtiMswNtCPrgAiRrT9yf/+i
	 oe2KL6CClPNx9nw5v5hNPw7FQaDWm1A6e4l3K4dave4hLI3RD5MMdpIScBfkxWMt/ALrc
	 k5BE0aD5LlbNAzGPEfIy8Ra2F5fxf1okyCUtuJH7gINuEkPDzpDVqaw729ZztH/GjuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZwgAt4T;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB75606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB75606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZwgAt4T
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1510145a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795085599; x=1795690399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqE0DnzQVOaqly9+hSqhRUU82CqCbvfu1P534JABEUc=;
        b=bZwgAt4TKqTsP1xWCq97VLu+tnoq+LiOuNQD/HqwsLAazfa4JIr0ZvR8So4m6B/gc8
         pyCh66xfyXhzvlqFYjormqzWR+xuCQVe5MHETbIk2+IAknavrZFAb2HuDzIV9YY4uD5E
         eXCmuqHHuQpKGj2dAUDbsHhu4JTv3sobzZRQx7SvCJ6c78zIEKZqkmT8TurIob+jPDQO
         l+Y2Byvtvx3HnX8UX9g2bVr18Tf/VnViCYbE/yj4usckpA3RAVus5ErQNhSmiI0lTFzF
         M/tA9ZH8Y2QwAcbDD8ncuGc3O2eCmFLrk6xcrK7An2VBmdR9dQSCi0QC0DsILEWkhtUh
         cFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085599; x=1795690399;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqE0DnzQVOaqly9+hSqhRUU82CqCbvfu1P534JABEUc=;
        b=wC4VEJoMO9q+5Qm3ktrz/hKZF4UaSQB8Phibn7aMXz0L35miHG3vr5PqDgE904WFPD
         5iloZjz9EYtydAdewUrYl0ZbDqsloYHKS+C7+E020VMa/s8FjnXbrrz04Fa6cfiVu72a
         7ey1Jnu8amKx/0dn46nqQm9DX8YDeyMEQqO5Cp0/AeDuOeXZCre63CiHwQU8LS8A9sxy
         BjIDQQ+xPiA+eX7TL9JUbKil4QUyCpPz9tGD6tuCmJKb0K4XdvUUeyZVsnTXJEFb3yid
         leVtE9nnmxtLrRw925JZb8mH6zsDo9K8iH7H2qiwdfdqI/TPyXiafqhRkHjw4igZ8AES
         2qNg==
X-Forwarded-Encrypted: i=1; AL+hErFm6orVR/dLwl6JydjDkKwc5BR6F+qS5ZyUoT2gJDap/NO5GUBGq/bEYI+IJ90bMYSIvegxFwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aOMxvyDJmAxroDazeFAQ5j7wVJ+WEjOhFCY7hBEz57iRyh4r5
	/O1eCWY2kNPbrLszQJLy4999IjR1+b0etRha8/IveDVmIJEud3IiiQwy9h/oy9dWS9w=
X-Gm-Gg: AZFdTZeh2WRi8oej/ecLOzm1kzahXbX91a7eqNZf3K3o+S0AwTBvMinG4+NdNjBLTcA
	FEmymUqSAyqKvJSdsodVsPQ0fvBj05xbsbZwTMFc0N8TTEW/4flgA7PwX0BsKQzB4lQYKUw+JCG
	vLlucFAcqG6Kz76mn2Ys8DEJp0FwkN9DJHrJK7vkhNnjSSN85OxPLUq+bBfs+Gj7tib7WbjV6Sq
	hFwKpJvTRA94sr1GvjH0i8/78R2E2URCj+u29HXoWXSPFlxfgF++IYH4kTUhUBzE9qFU3m0N6AV
	4p2JFIAaMj9dfFnNXZ9UFSIv5DdtK6s2JpR5BpbIXJSGi25wAguTf7tiVw2tcyJlDOn9U2HZC84
	I+jsvzukmZEgHkA8TpENcw+sG/9OjFQ2E1qtuu7GTFwizooUzZiPosVF9N0orm2B2pl1VM1y/Hl
	DBWudaguJyrLBW8ICwyKetWc6PQjte0CwIdfkIRwA14eVCbV/mHmrWkJljwwxwNEABjHRq1O3NZ
	n/weeiSxAaYLxzpvUASLtr4hZcaNEGbC+BK0z+JWZ2IgxyUTA/YHd9cJ0VrMD5a3eC/88neIu2V
	WZVMYMnF9nBDHOy4uV8Cd1u2Efwe9chiENMF0auKltsveuQ5z+H7ZlX7xdCoSo6GF/UbN3smkdl
	ClMEAop36Lcd89dsk9eOlM8Dz8XchrbkhU0Hy/w==
X-Received: by 2002:a17:90b:3d8f:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b3d07c687emr4819843a91.40.1795085598784;
        Thu, 19 Nov 2026 02:53:18 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm2246604a91.10.2026.11.19.02.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:53:18 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	mjambigi@linux.ibm.com
Cc: tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	guangguan.wang@linux.alibaba.com,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v7 3/3] net/smc: carry oversized SMC-Rv2 LLC messages in the queue entry
Date: Thu, 19 Nov 2026 19:53:07 +0900
Message-ID: <20261119105308.2567241-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820023346.BF2B71F00A3A@smtp.kernel.org>
References: <20260819023306.644849-1-yhlee@isslab.korea.ac.kr> <20260819023306.644849-4-yhlee@isslab.korea.ac.kr> <20260820023346.BF2B71F00A3A@smtp.kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The byte order point is right, and it is not something this series
changed.  num_rkeys in struct smc_llc_msg_add_link_v2_ext is a plain u16:
smc_llc_fill_ext_v2() stores lgr->conns_num into it and
smc_llc_save_add_link_rkeys() reads it back, both in host order, while
the rt[] entries next to it are __be32 and __be64.  Between a big-endian
and a little-endian host a count N below 256 arrives as N * 256, and
min_t(u8, ...) turns that into 0, so no rkeys are saved for the new link.

I have not sent a fix because the right one depends on what the SMC-Rv2
format defines.  If the field is big-endian on the wire, htons() and
ntohs() leave s390 as it is but change the bytes an x86 host sends, so a
patched x86 host and an unpatched one would stop agreeing.  Could one of
you confirm the wire format, and whether that compatibility cost is
acceptable?  I can send the patch for net-next once that is settled.

Best regards,
Yehyeong Lee
