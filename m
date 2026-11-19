Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047344;
	b=uGWB8qf6PliDBRuwbpIPF0iujnbcdKha7fDn8qiK8wfNwe8HYpN4JErBA6snypoCOZbF
	 KP3KJKulfdb+Eu/RXsa5mRVph2ZT+EtVUeJU7/8AiGo/faM1rk/stP7kqjnoWeYF0Yg1/
	 jEsKQTMHZuIHU7JuiySdy+W6j5PIGy7/ZSE1QWuZZFSArUg9appwdn5mVf24MDqVG+cFs
	 WnuvNSzbOKen8VG64MvMJWdi4uwuAtkufTwq9NjfSWo6Qp1Cvo9uGu86qV/Hicv+ZVBHC
	 pbhe627gBkyxDxdxBBR0pEUtGFWmaYKUKMwwr7c0YNRger1JQMopHNgQUO0zMNlLQDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GGLWO5HqV8utX0YEsJUTAdfePdVILSxQ8MS1FL2bJAU=;
	b=EuSUAoGiOS1g411rLvSYYF1ebD/5yy08p7eNPYLJ9HaX9RXUL4OIzXmnDOMfVwEEqV5i
	 BIFlBRVDbsPmi8rstHHaxXqj5Vcv7qPKvRsx05qJes/ypFk4ZBPk/LKRXXNEejU+U5BLK
	 wRlJR6sWLypaO/5Z5p/e6gPoNxuaieFjECQwl6jZ6JXR5OlXxdPS2AXZh3v9b7Br00V0I
	 R325hTI6dhxbby1So6HW+5sWNW4XU3fExO+1rIOVplD209TmeGPAzJewViA0m37i7Mh85
	 Gt+KbzeLqmseewQXwh40Y1nOSnI33jAZ0sNbEma3B4asQiij1d9T4Yl6Z8Z/qmw2LwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qmGvq67a;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FE9606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qmGvq67a
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so116538a91.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795047343; x=1795652143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGLWO5HqV8utX0YEsJUTAdfePdVILSxQ8MS1FL2bJAU=;
        b=qmGvq67alvApBFL43K31TIe7JOiREuJ5mYRw8iXzVD5hYJ9xE5B80W3w/c4WNoO7ut
         QMXArvr32QuvWnAHJ1DnMqjsUS1rikdrGPSoxx/h3mfL+wfK3/csbaegydkfV/9UCW16
         7Db2bcknGM+nG5TtlsdJL1YNbQG1qc/776Dc/mJinqZqjsXuZo+GYzrnd8s9jgrAqoED
         /IWALtOZvIOPk7/DZyNCv4hn2rVHWaWyXoNd3CZ08LJUwFZQEJ+UkkLlfaJTZPqj481M
         rAjsNBQdk32T516BOj6tL6xwTg83dCljaHm/RXX7DxT+VoVnEy7DWUu2uTqs9C5yWLGB
         /ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047343; x=1795652143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGLWO5HqV8utX0YEsJUTAdfePdVILSxQ8MS1FL2bJAU=;
        b=cjoEPTkfNPRL95Aj5ez4u/PPgTelzx478xEFn/D+wqWakXFlyo9BBiwG5+2hgVNro/
         jW/85VwQOylFpdWSS+aNigxaKERSzxZ329jfxS/fdB5h8UGHLi7xtcRnSe0rBZV9dWwz
         TmAMjM6z+TGxaT1fAL7FKspS5ZxhMwYCCbdvrJ0aCLI5gkaGaqwM+Z/NOiyKCDLh9Q8W
         POuc3Trr8yXAwbvlvzHh4a+b/9Ce+DuUs9UzsTj2xhkGm+WA0+tB0Te3sCrX6U/x+1pl
         PwAU6AAtLzN3p5i3F60y1e174+x2zaks0UDHDyJ+dzeRHa3nigoW1VnDMcr0Ql9kq433
         opvA==
X-Gm-Message-State: APuU4Z+2eNQJgqIgy6nbYwsEN2aszPszLW8OJYFIi6smIsQnOvYZ81rE
	ITcPb6CthwS5LpZsVgC7WP9hwimeHUiFx8sxGrc0GaPYSFRlCrjsDGPoDv3XYi4ehkou8Jug47K
	CL0UOaZU=
X-Gm-Gg: AZFdTZdULUKIgThz8Wi3CYukh9y0PcGd3tlmrL3QLAY9YgGNc8idIiR9jQI344n33mn
	6MbmMm9g6baPL1RUpXLNImBzSPfIELjzjRmV6Ibxyzx9LnKMLpEoe9/hXjDFMkv8VlV2YeEfOtW
	Wna/tHw7hJw98cTxleWlgl42mKPaW46ZaGgVELJJNvCSxP8TvyNnMvNK77o+1lx4JkznBSd6/oI
	7AC5EiuCWDbuykzJxDnbIfZR+WVF8WxwAef9RBjoQ0vfJZ+2U0JB8xXqfM539LRpNejfU2GLnU1
	yaz3OrbicGjiC8TokRESR1vSmdRYBq7JBGKpCBLRydI8VO4PDh21oApCHq+cph7kC/IAVM8SCvn
	w5d1UejrN6ttG5Yh2Px3dPjeT8ooeAmWHIjf1H0uXRauiRbfmOetChmrDh3eWpzFPuXshhB0JzM
	iFoy+pqpd2IlrBlhrWUjyI3zCpwZgY4jWDHIrnXEHO8qB2Fq8T22/5v9baoASjp5zAeUxOoSvc+
	C+J6wPhKV5e4l6n+TPEwtaWDKywMnc6dAZdGqXVRPniJoeL8+ESvtNDS59m1emaD/Pi+HIQcJIY
	38XcOBua3owPj8gW+S5ZtTzM0dmVcx+GlJAajvQtg+JBsS4S41lPmjCbJzOrBtyam4Tb
X-Received: by 2002:a17:90b:1643:b0:3b3:b0f4:1bf5 with SMTP id 98e67ed59e1d1-3b3d07b803amr4079501a91.25.1795047343057;
        Wed, 18 Nov 2026 16:15:43 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b62e7sm444278a91.11.2026.11.18.16.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:15:42 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next 0/5] bpf: fix mount point parsing and drop the legacy loader
Date: Wed, 18 Nov 2026 16:15:04 -0800
Message-ID: <20261119001539.2868072-1-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
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

While looking at OSS Scanner reports noticed a pattern of issues
around the BPF loader. The first set related to parsing of
mount points with fscanf("%s").

The next part were issues from the legacy BPF loader which
is no longer needed. This series rips the band-aid off
and related parts no longer needed.

There were also some bugs in error handling found
while changing all this.

Stephen Hemminger (5):
  lib/bpf: parse /proc/mounts with getmntent and check fs magic
  lib/fs: parse /proc/mounts with getmntent and check fs magic
  tc: remove eBPF map export and exec bpf import
  lib/bpf: require libbpf and remove legacy ELF loader
  lib/bpf: check for missing bpf fs mount point

 bash-completion/tc                   |   18 +-
 configure                            |  107 +-
 etc/iproute2/bpf_pinning             |    6 -
 examples/bpf/README                  |   18 +-
 examples/bpf/bpf_map_in_map.c        |    4 +-
 examples/bpf/bpf_shared.c            |   14 +-
 examples/bpf/legacy/bpf_cyclic.c     |   35 -
 examples/bpf/legacy/bpf_graft.c      |   66 -
 examples/bpf/legacy/bpf_map_in_map.c |   56 -
 examples/bpf/legacy/bpf_shared.c     |   53 -
 examples/bpf/legacy/bpf_tailcall.c   |  117 -
 include/bpf_api.h                    |    7 +-
 include/bpf_elf.h                    |   35 +-
 include/bpf_scm.h                    |   77 -
 include/bpf_util.h                   |   41 +-
 include/sha1.h                       |   18 -
 ip/iplink.c                          |    4 -
 lib/Makefile                         |   10 +-
 lib/bpf_glue.c                       |   15 +-
 lib/bpf_legacy.c                     | 3306 --------------------------
 lib/bpf_libbpf.c                     |  259 +-
 lib/bpf_util.c                       | 1100 +++++++++
 lib/fs.c                             |   33 +-
 lib/sha1.c                           |  108 -
 man/man8/ip-link.8.in                |    5 +-
 man/man8/tc-bpf.8                    |  173 +-
 misc/ss.c                            |   30 -
 tc/e_bpf.c                           |  157 +-
 tc/f_bpf.c                           |   15 +-
 tc/m_bpf.c                           |   16 +-
 30 files changed, 1246 insertions(+), 4657 deletions(-)
 delete mode 100644 etc/iproute2/bpf_pinning
 delete mode 100644 examples/bpf/legacy/bpf_cyclic.c
 delete mode 100644 examples/bpf/legacy/bpf_graft.c
 delete mode 100644 examples/bpf/legacy/bpf_map_in_map.c
 delete mode 100644 examples/bpf/legacy/bpf_shared.c
 delete mode 100644 examples/bpf/legacy/bpf_tailcall.c
 delete mode 100644 include/bpf_scm.h
 delete mode 100644 include/sha1.h
 delete mode 100644 lib/bpf_legacy.c
 create mode 100644 lib/bpf_util.c
 delete mode 100644 lib/sha1.c

-- 
2.53.0

