Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090897;
	b=wNIOVrU+QJ5dxL8NbrrX+QR/opsMT0WEqvUF9OZAX0qO6y0oBAQDDBHzyncHpxB/IPPZ
	 WlQ5Kyu12XWU0lGRLKiVSXHtZJCyd+uhj2L7kDqo5ePNUcwQv+KbUh6vRUBDxwJfVKblA
	 TwIIZU98gFrmronX8BCTtxHFeHAnVQw4tKqmk7ks48jqiGjhE13Vj1sb8mbFYWHf871lc
	 yt6frp6YGhFaKfbWdW2Vaiw1ZndbV8/IbuobpuUf1JdoUKbcMm0vli6pfHuuHAGd+j2D7
	 lOGqGL2bt46OOM5SWRsSws5oTuVA9zMkQFj+11uYUTWa78I7U8TMB5OBKoIWSBK5BuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mj1McuRNTzXxQ0Vi1QpFi73wKse6XG0UJPSQ6IAq1dA=;
	b=W/ljuIwzdkygpdtw1JfhHZUybqVwrv+dX3+MMY//ghkrWT7ptp6SveuFvEhWDkfO3MiV
	 gLIJ8J13/e63n6OU434VcPKvCqjX++FoPxgfl7amaY8ZBZO3+2xS14sbFotKow2BABUDE
	 krDzkoEUZWKx2BKaYseSr4xr2JMtCrYD60NQZAfUOM9usxG251UpZuOMiDuENPar+9RKA
	 2vWmkAslOV0eO36K8GmSnoj1dvzhrqMw9OGtWf6wy5Vn2954T9yENOGqVQ20ecdNs3lzt
	 rPwjMiJEeyifHzOygP+uBpnkgpU+s/2HN7sf8XiFUvBO5tNCd74WeFCRq/U08fcT5hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Ew2Fc1IF;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358EE606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358EE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Ew2Fc1IF
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so19572425e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795090895; x=1795695695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mj1McuRNTzXxQ0Vi1QpFi73wKse6XG0UJPSQ6IAq1dA=;
        b=Ew2Fc1IFAkcgGD88Y0f1zgQZPaLC8hbgijX3nUk8nAuxsY0UJVAWZCZ9Oupiu+vtoq
         wxlNdGrUJ0E6XDoo+0DFCLWmDOGm0rfeuAbo1YChy/9BdCuD0gJ6Kv4FOgns7AWvrFKH
         sS5uL+7JydSvONlaPpaWIIAXq8KzYEzouh32AvkdxAuH96aHJ/GPSRRyYBWSwguHVumF
         1hoOOCjmzHNeor+R/KARgWBr7f2+rX5E317wegmi6HneMeDgnM50XmYuuHHhOif5N169
         KKTPGFzwF4XAQsE1taqFESqsHMvc9yr3rWlpTZSPD0Pgq1oIxHuPlVlH+Ji5l1S6TMKa
         3Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090895; x=1795695695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj1McuRNTzXxQ0Vi1QpFi73wKse6XG0UJPSQ6IAq1dA=;
        b=2XW3ftiPjXf/txipMTV+T1xIZk8+q7LqXTAsSoAakctwVi65AmoeyVKvnqGgBTNgph
         9j01BlBeZdzMmJis5IOh3/o2lFybVDoPW0K1LXoGDSorTtoF81rx4vIN1/xajGyWKb1/
         ZFplRGYRNjsYyp/8kxJw+jsqrkp6GzhfCiSiILvnstvhMMy0Pl+bh+rG71sTLIkv3VCY
         4nIhbTTN44JzZdvhplfOgLbfAwPHBRHcsFpUUsJLTFrA4hEHmbpEYGn6mT/u9YvNa1fS
         LWeTxPVHuNvka81O5+QyVMW7DoDz3V8w7qlZNO5/5MtLL8zqOTV8YEaoS+NZegZM5Hdz
         eTUQ==
X-Forwarded-Encrypted: i=1; AL+hErHo9xpm0Nz1bGY/3EesIsiH4nPtsp86LKkkRhOZez/sFty5j1NDsF0moSZAMiGuzmrZocHeIb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FSNeKE8Yt8LVBCvGK0UzFatXK4iwK0ALrXmt8g/sDcyW3yhCs
	/H4dC6tQUxHw/eyHINR/RHNvvcrb3xbflvc6YHn817+BiQrmy7FAySiUSLNYMAViR1s=
X-Gm-Gg: AYBFou3udTadheuVfGYG/Ebso5gS8xoEHtH59en3sPQAPSAkXOaglepRRIPMq1TG3b1
	QwI3Lq+v80RgIi1/Es7hb1yz8CI2AiBuwf9ht/c8jSED8b0+NEjK+QgEDSZTKMxEAvrmaUOpF11
	JnSw3vahalPsvG8hhGH/FQtdIu4adsrdgXWdP53FvUvogNgEhfBNNLYCUyqj1KqqN9lMF3xgf75
	2HqdCiApNdMDdB3K5gvLxnWBhdc1kdjq+JXudOiTRcV8VG3qjH/oM6yoTNsd6ykAEGox82U80fX
	b41dcUbYRamFVckFDH0EM33VxeMvi6EZhhj4ZIY8LF3AigW2Xhuax4Kzi6MAmxbiKTfsvhpveBT
	b86KGQxFeQzeBZVz4Ywb11doAFP7iO334g+Y1djZ4pcOwSRbm2yGgRRp6UXXSLaYw9G/i8oV81X
	Ugi45IDvodQEf6WG7ztdEFsEF/kSHAaemw6K1l8xnzBgNLAeV7M7Yak41PPhMcZ/K8OZHdJxFSy
	UIDsBgwWrNa0JKzmvaFb/wBp72XICmPMhtCVj0kINxWvO7PAUVfzPgKU1KK+tCiTpiDQF6/qopb
	i/A5Hb1U5tCaERNLNw0+eDaK
X-Received: by 2002:a05:600c:5020:b0:4ba:2bfc:c8ab with SMTP id 5b1f17b1804b1-4bb7da12dbcmr107839415e9.15.1795090895473;
        Thu, 19 Nov 2026 04:21:35 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535741esm52370925e9.11.2026.11.19.04.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:21:35 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <courmisch@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Morduan Zang <zhangdandan@uniontech.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH net] phonet: do not autobind a socket to port 0
Date: Thu, 19 Nov 2026 13:21:27 +0100
Message-ID: <20261119122127.1708071-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

pn_sock_get_port() walks the local port range to pick a free port for an
autobinding socket. net.phonet.local_port_range may start at 0 because the
sysctl lower bound is 0, so the very first candidate can be port 0.

For port 0 pn_find_sock_by_sa() falls back to matching by resource and
usually returns NULL, so port 0 is accepted. The socket then gets
pn->sobject = pn_object(0, 0) == 0 and is hashed into bucket 0. The next
lookup that walks bucket 0 -- another autobind, the same socket's next
sendmsg, or an incoming packet to an object whose low nibble is 0 -- hits
BUG_ON(!pn->sobject) in pn_find_sock_by_sa():

  kernel BUG at net/phonet/socket.c:77!
  Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN
  CPU: 1 PID: 6883 Comm: phonet_bug
  RIP: 0010:pn_find_sock_by_sa+0x3a9/0x590 [phonet]
  Call Trace:
   pn_sock_get_port+0x1da/0x4b0 [phonet]
   pn_socket_bind+0x312/0x580 [phonet]
   pn_socket_autobind+0xaf/0x160 [phonet]
   pn_socket_sendmsg+0x4b/0xe0 [phonet]
   __sock_sendmsg+0x1ab/0x200
   __sys_sendto+0x1eb/0x300
   __x64_sys_sendto+0xe8/0x1d0
   do_syscall_64+0x102/0x2d0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e

It is deterministic and triggerable by an unprivileged socket. Skip port 0
when searching for a free port; 0 is reserved for the unbound state and must
never be handed out.

Fixes: 5b0c911bcdbd ("net: phonet: do not BUG_ON() in pn_socket_autobind() on failed bind")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a review of the CVE-2026-53292 backport.

Reproduced on debian13 6.12.88 (CONFIG_PHONET):
set net.phonet.local_port_range to "0 0", then send on an unbound AF_PHONET
SOCK_DGRAM socket so it autobinds -> the port-0 BUG above. With this patch
the same sequence no longer crashes.

 net/phonet/socket.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/phonet/socket.c b/net/phonet/socket.c
--- a/net/phonet/socket.c
+++ b/net/phonet/socket.c
@@ -490,6 +490,8 @@
 			port_cur++;
 			if (port_cur < pmin || port_cur > pmax)
 				port_cur = pmin;
+			if (!port_cur)
+				continue;
 
 			pn_sockaddr_set_port(&try_sa, port_cur);
 			tmpsk = pn_find_sock_by_sa(net, &try_sa);
