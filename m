Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098495;
	b=FKBymD5az5ogHcm0TMpCikNY3Nb9qtEK4txoPmRXYVqkaYVt4cjIIEP2fXjhkQsT9D5T
	 AblNWwb4IcS4PtEGh0f/QAz5qjmH/UdlKZcNESiKLf3w+evbohamMN/lu6a/Sfc6bso6S
	 oEuGoVYq9rNL4Bie5Xtr1OdB93xaSHNg5L9qW4tKnBs8ws/dby6+tKl545EYT1hiYsDbh
	 cRW1uuwiNCwleDZtAsTtQShIrgJMnZcd9H4822CMXioHta7H748rbOMOB2ck8gK9JNBGA
	 EBhd8b137Qz0UKKw0vY/he9JTTDi7+XOW3KyVIy8jBbyPdgLbNUiqBbhsjy9nzUrSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c6AW5dUooA9YS7k8SDY1HAiCAArAxhqay8nJwsjWk38=;
	b=CFaXSsU60MyLYNPf1k3kYH/Yh2UtXy15mzyzk/qJevFr0ZEcVQGmopnOZEQ045Ny7a8N
	 RL4Ia2hUxDBKzM3KF4swShtU6f3zyvWX55+AFdIq7GBDpI2tsPvqaaMYvJxwFJ8NfNQ0j
	 u7DJooD9do+3J63FCJAP5+v0cXMnmyKKywp7EGNfeQFgvpyEbuGM+AuBOlKIuknTszVxL
	 mLviRZPqv3Hq6Hj6uQ5Rypnm2miEsIVKuAG03Zsl41bXIjWU6A549NnlzGWxffo8ia/GE
	 8n+/SAUWzGtdU7eI9fgU+uJbtuS6cguGsp8zZ2UwQOFH9+b1/NGQkA5KJ7RECwIsipg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GFMmxmlT;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6613606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6613606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GFMmxmlT
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1489794f8f.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795098493; x=1795703293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6AW5dUooA9YS7k8SDY1HAiCAArAxhqay8nJwsjWk38=;
        b=GFMmxmlTeg4lmcmksN5pGIa7GpSGUnQpOkbAB560NgB1+QEYDTKYYDPrspwGh0ep0d
         idcBoLmPOU2O0VNLWf5RC/NW7wCC39yeZPkbBovI4zq1hdAdPxQM5zFU037V0iSoOUN6
         79eW991Rzxp5piOMdwmjlgbKwbZu4RXrfGaorLiEebi06PKQEpHZNlHnoOewsrpyPJ34
         nopxKSJQJA8VJYHdOXX5oF+xntH4eOC+PQB0ComyisQuGiaCSlsh37SpJpujvcbNEXk4
         aqQiByuLTX6piIdv13KIABAijWJ03DM18mzgnPrJb7CG1zPoHxsWL1/Uj9mcbBKOJ/6u
         aS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098493; x=1795703293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6AW5dUooA9YS7k8SDY1HAiCAArAxhqay8nJwsjWk38=;
        b=04MmB2a2qHZxOPa869VramjSZ85Tsg/2fTcu2bCb25K0b/vpRaMScc9e00NzSw1j0V
         d4EFqVJalMhd94WdAx53/HgAeAhEE2e94uLqrWD2KOhfGApO88PJ2EFmKrlfOGX1NA9P
         lD6T4nqr7um3FgAJIagDmNBZFYlS5pml8yGIog8fy1FMP2P2VQ7gnXqiITppaQM2T3Ur
         HR8YoZ46bUF2DoYWfuHE3lxG6Xq+w9IIRUWDywycd3kgRr9FB92XiQZdoiO5bQ/7winj
         +Evj9+rFpGjixoyHNv8tgfN4bE8ze/CSUUb03qCxrjgwgIXKrkmZsFZawqRbT7sgl0U8
         ZRyw==
X-Forwarded-Encrypted: i=1; AL+hErFCSIvMYaUfd/9B+K/7yC67Y222TUGcceZbx+M+O7r/Q6ZjTVEx8fl6xvd8vCWfcmKQLHF2wvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z//HSaV2Rryx8Pk4hvUbz6iuabnExSpZQ2jiPr00YZ9KccA7EgN
	ZqPgC38rkD1GTCoH6+AtxUSPNXR7uWYIZ3fu2gcdOVQQ5CbQLl/ZeD1aZ95TRAjw+CQ=
X-Gm-Gg: AZFdTZfGwMoi6sEfkkXLtRF8ZnTIPNHl30f9nuNmXap92SqGpEnsjvg7n03ju2FyOqS
	1e032Ei1SnckyguBynV2Og6/v+dGOFnVT3C7IRMtUp6F+nJ9GARchrUEEwLI/6t0gFOBIhjXU1W
	3O7ZGLmAN35nOjyhTC/1AlzvmqlMlU/gQiMPzLP3kpVtyanM+goaL2PbQrIniAC/htiq+029Ki1
	kkhlHtEyAeFMWqF3L36qpEoEkpae8KZ/RnVebBsfpDzzINNtHqxIPXSxiEvEiQv/mbdwf5GHgiJ
	HcLyOxSCp11StA2Cdmkxnk4CuhtrSTXx8456DJpifEPXzxJiOBiC7sVgnfMt+SRIuuoC7SpU0IG
	PHQp65lDlibwLU4OGkHvBxTUZfU29TWxaGW2Xbs8NeNfpbzVL84VYexI+8TBsujRiE00JzD8g7i
	3hnvwiDghLuWNPvX22tE1tIWE2BW8JcgWd8i5pluNpgx10B0GvgumJ2RNXaX/rDjvxwCks3IrKc
	iQT/sxKJZT5SIB6xQeGIgX28hmz3KvIAEThod1abTr3Kz+0BUWvKcvvZQOU7hg3iDkHz0i2Wbd8
	vjlHuuV+f1ST/rP7k+jmIUnoW2PctKCB0u5tUukYKuX33eAyW/Q=
X-Received: by 2002:a05:6000:2f87:b0:4a3:7954:ac75 with SMTP id ffacd0b85a97d-4a63bea51ffmr13234379f8f.37.1795098492457;
        Thu, 19 Nov 2026 06:28:12 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab55e241f9sm100055f8f.52.2026.11.19.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:28:10 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Joe Stringer <joe@wand.net.nz>,
	Paul Chaignon <paul@isovalent.com>,
	Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 0/8] bpf: add bpf_sk_assign support on egress
Date: Thu, 19 Nov 2026 16:22:22 +0200
Message-ID: <20261119142231.2612515-1-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
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

Hi,
This patch-set is based on Daniel's [1] original set that adds support for
bpf_sk_assign on egress. It is useful for the TPROXY use case which needs
to assign a listening socket (e.g. Envoy) to an skb on egress, other
potential use cases are to attribute forwarded traffic to a specific
established socket for qdisc flow classification (fq, fq_codel) or cgroup
accounting. In order to support bpf_sk_assign on SOCK_RCU_FREE sockets, a
reference is taken and a specific destructor that unconditionally releases
it is installed (sock_pfree_ref). That destructor is used throughout to
recognize such skb. For more information please see the individual commit
messages.

There are a few limitations, also noted in the commit messages,
more importantly:
 - software GSO splitting after assignment is unsupported
 - decrypted egress skbs are unsupported
 - loopback discards egress assignments

Maybe this can be applied to a feature branch on bpf-next and then pulled to
bpf-next/master and net-next/main so both trees would have the original
commits and not duplicates.

With the kind help of friendly LLMs there're 19 new selftests that exercise
various sk assign (16 egress and 3 ingress) scenarios such as:
 - egress reuseport (4 tests)
 - ingress redirects (2 tests)
 - egress redirects and drops (4 tests)
 - classic tc actions (3 tests)
 - netkit proxy delivery (2 tests)
 - netkit with NFQUEUE (4 tests)

Thank you,
 Nik

[1] https://github.com/cilium/linux/commits/pr/bpf-tproxy/

CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Emil Tsalapatis <emil@etsalapatis.com>
CC: Ihor Solodrai <ihor.solodrai@linux.dev>
CC: John Fastabend <john.fastabend@gmail.com>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Joe Stringer <joe@wand.net.nz>
CC: Paul Chaignon <paul@isovalent.com>
CC: Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>
CC: netdev@vger.kernel.org

Daniel Borkmann (3):
  bpf: Orphan prefetched sk on skb_do_redirect()
  bpf: allow bpf_sk_assign on tc egress with refcounted sockets
  bpf: support SOCK_RCU_FREE sockets in bpf_sk_assign on egress

Nikolay Aleksandrov (5):
  net: track references owned by prefetched socket assignments
  selftests/bpf: Delete assign_reuse namespace when opening it fails
  selftests/bpf: Cover egress socket assignment with reuseport
  selftests/bpf: Exercise netkit socket assignment to a host proxy
  selftests/bpf: Check assigned socket lifetime across queues and drops

 .../chelsio/inline_crypto/ch_ktls/chcr_ktls.c |   5 +-
 include/net/inet6_hashtables.h                |  10 +-
 include/net/inet_hashtables.h                 |  10 +-
 include/net/request_sock.h                    |   8 +-
 include/net/sock.h                            |   4 +-
 include/uapi/linux/bpf.h                      |   9 +-
 net/core/filter.c                             |  22 +-
 net/core/sock.c                               |  11 +
 net/netfilter/nf_queue.c                      |  16 +-
 net/sched/act_bpf.c                           |   4 +-
 net/tls/tls_device_fallback.c                 |   5 +-
 tools/include/uapi/linux/bpf.h                |   9 +-
 tools/testing/selftests/bpf/config            |   5 +
 tools/testing/selftests/bpf/netlink_helpers.c |   3 +-
 .../selftests/bpf/prog_tests/assign_reuse.c   | 625 +++++++++++++++++-
 .../bpf/prog_tests/sk_assign_netkit.c         | 586 ++++++++++++++++
 .../selftests/bpf/progs/sk_assign_lifetime.c  | 182 +++++
 .../selftests/bpf/progs/sk_assign_netkit.c    | 153 +++++
 .../selftests/bpf/progs/test_assign_reuse.c   | 174 ++++-
 tools/testing/selftests/bpf/unpriv_helpers.c  |  16 +
 tools/testing/selftests/bpf/unpriv_helpers.h  |   2 +
 21 files changed, 1794 insertions(+), 65 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/sk_assign_netkit.c
 create mode 100644 tools/testing/selftests/bpf/progs/sk_assign_lifetime.c
 create mode 100644 tools/testing/selftests/bpf/progs/sk_assign_netkit.c

-- 
2.47.3

