Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058605;
	b=iRJHRx/JfFCshYNHqex1y9XDgoxo3jCcHHQGJeFbLwB/8OzD9f0UaKY8BrsUATegzv0D
	 vuU+fdzUTbWxaBzSsQ00rzcR50xzElGROKEsVrKI8eNY2tlDKoqpfc6FCTjQH6T3DGmkH
	 C2CWCep1EvIFlPLR7ojKjg82Z9+uuoEhXzNgZBaQdMw22DRVWXM/fQTcQbDJ61MLYExtk
	 CZHeBWscsU4on+9EFM9Nko6BVNQ7o+CS5ONECFj/tc5AS77uCBQtsqr4ytBJoEmQpv64x
	 pAZe84zUS4s+V+ZC89piUpPa5Rl7dEXPUHPqQ4Zmw+XhOgByJF3ndxtcO8FZptUH3hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058605;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=b7ERAkvsOryKxLyJs2OP57OtLTKeakjxqGV+UREfRks=;
	b=G4742Ec6KoSLmWWf96LnnFYl8IKYawd5Uw5k3FDwYedbxOVTljOr3oZqC/rLA0I11dkU
	 AtmbG/p9qJWaIrrGAyXofvlLSGp9I3EJztbcm4LZhts5XoNnQrCnmqgQmGnqMdBuzRrA8
	 kexAyTCevSUPwug1Z/iIf2cwcFX6q3BSZLHaYGCKTxQIVGVzXUFnOIIFEQzTolBFVx00N
	 K4fFiQ4qfQQOjqfRPRzE6JZ8D7k34sseSwhFRvMQeUBQc5jyAii7gQ2ZFnc9L6MF+PNDS
	 zzJr+pBwJwvPS+A/+3GZidarp/uVZtBodVTcfx4TAsbmhwon3aCUztlCvRUFTHeGNPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=F2yuT2VR;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D7F606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D7F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=F2yuT2VR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=b7
	ERAkvsOryKxLyJs2OP57OtLTKeakjxqGV+UREfRks=; b=F2yuT2VRHNcMa7yf+c
	rTzA9vQnup2q6vsVE4Gpa0OcTZxOsdJEisXBJzNuurXH2/UnzIZXB4OcGOClG4uM
	dAfrPVEFG+Zd6aZTAXbizAC76gGy6W+qZudbowTsoHtyqFXmKorRftjUjhyyz51Y
	0+0VoBf6wQCYJ9dt1Pz+946Y0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDHrxGQa_5qYlvqHw--.39351S2;
	Thu, 19 Nov 2026 11:22:56 +0800 (CST)
From: Rongguang Wei <clementwei90@163.com>
To: netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	alexei.starovoitov@gmail.com,
	kuba@kernel.org,
	Rongguang Wei <weirongguang@kylinos.cn>
Subject: [PATCH net v11 0/2] tun: fix re-attaching the socket filter
Date: Thu, 19 Nov 2026 11:22:40 +0800
Message-Id: <20261119032242.71919-1-clementwei90@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wDHrxGQa_5qYlvqHw--.39351S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw1UXrW8Jw1UXFWUArWUurg_yoW5tF1fpa
	1rW345Gr4kW3y7Ww4xuw4xZw15Zw1kGF13uwn3G34ruFWYgry8Z3yI93yYvFnIyr92gr43
	JFnavFnFg3WDJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYVbkUUUUU=
X-CM-SenderInfo: 5fohzv5qwzvxizq6il2tof0z/xtbC4RFZxGr+a5GYhgAA3d

From: Rongguang Wei <weirongguang@kylinos.cn>

This series fixes attaching a queue to a TAP device, which re-installs the
socket filter of a persistent device.

TUNATTACHFILTER keeps only the sock_fprog header, so the instructions are
read from user space again for every queue that is attached later.  Keep
the program on the device instead, run it from tun_net_xmit(), and record
IFF_NOFILTER per queue.

Patch 1 does that, patch 2 adds selftests for the re-attach, for bad
programs with and without queues, and for the IFF_NOFILTER paths.

Thanks to Willem de Bruijn and Alexei Starovoitov for the reviews.

---
v11:
  - keep one program on the device instead of a copy per queue, as Alexei
    suggested; sk_attach_filter_kern() and bpf_prog_validate_classic() are
    gone with it
  - TUNDETACHFILTER now applies to queues detached with IFF_DETACH_QUEUE too
  - selftests: cover the zero-queue and detached-queue paths
v10:
  - add bpf@vger.kernel.org and the BPF maintainers to Cc
  - selftests: fix the queue numbering and add a zero-queue case
  - https://lore.kernel.org/netdev/20261030060043.94719-1-clementwei90@163.com/
v9:
  - zero the whole sock_fprog header, so that the padding TUNGETFILTER
    copies is not uninitialized stack
  - https://lore.kernel.org/netdev/20261030060043.94719-1-clementwei90@163.com/
v8:
  - narrow the bpf_prog_validate_classic() contract to the classic
    verifier and note that it can also return -ENOMEM
  - commit the new program only after every queue took it
  - https://lore.kernel.org/netdev/20261028093235.148649-1-clementwei90@163.com/
v7:
  - verify the instructions before anything is replaced
  - fix the kernel-doc of sk_attach_filter_kern()
  - reject a program whose length is out of range before allocating memory
  - selftests: add a case for a rejected program with valid length and bad
    instructions
  - https://lore.kernel.org/netdev/20261023092239.186665-1-clementwei90@163.com/
v6:
  - add description for return value of sk_attach_filter_kern()
  - https://lore.kernel.org/netdev/20261016070654.170932-1-clementwei90@163.com/
v5:
  - add kernel-doc for sk_attach_filter_kern()
  - fix the wording of the mprotect() comment
  - https://lore.kernel.org/netdev/20261012021113.45939-1-clementwei90@163.com/
v4:
  - merge the kernel copy and the error check into one patch
  - charge the kernel copy to the caller's memory cgroup
  - https://lore.kernel.org/netdev/20261003063859.136895-1-clementwei90@163.com/
v3:
  - reorder: the kernel copy of the program comes before the corrected
    error check
  - add sk_attach_filter_kern() in the patch that first uses it
  - https://lore.kernel.org/netdev/20260930080746.135017-1-clementwei90@163.com/
v2:
  - roll back the filter attach when a later step of tun_attach() fails
  - keep a copy of the program in the kernel
  - add selftests for the re-attach and for a rejected TUNATTACHFILTER
  - https://lore.kernel.org/netdev/20260929093712.131096-1-clementwei90@163.com/
v1:
  - https://lore.kernel.org/netdev/20260923025653.59348-1-clementwei90@163.com/

 drivers/net/tun.c                 |  93 ++++-----
 tools/testing/selftests/net/tun.c | 358 ++++++++++++++++++++++++++++++
 2 files changed, 401 insertions(+), 50 deletions(-)


base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.43.0

No virus found
		Checked by Hillstone Network AntiVirus

