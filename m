Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764249;
	b=A2+SSOByG6q2sxa/wki3t54o5x+gq0eiK4/rn57QJk4f5jMx1A5zciWCoDHM2UYk8x49
	 Ono7uF0T6jZouzVOaY/FxMbd5YhkRrlzSekGkZHXofSIh0lTeSlkgtayOoYs8p+iyrb1x
	 jUfbKpLmOOh2zqQxeu20X3U1V9uj4j8+fbskOu3RXjmwUVBLl0ITeDYk8IwOYP9l25J55
	 DQELvHvHE2OPwr5yh/kl6jCoEnGbO7D2uRxiFUkoV6nHHO8aUABsOpZPGiUtJbtFrTXli
	 m3kwErCxcUmpMyh6/Rd7eoBrK+B4pSwm8eqBDQTL+YUhw8AIxitgPGVsu1Du8VRv6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764249;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=6RU1oFKuMHhPcoUnNRgnbZ8lM/IXfFQubzFnoTFvHE0=;
	b=wdBjrJapo5MzEJkFxkBP7GGjqKwoBbUl739wFaVyvSJyJd/dOS8+T10U91HuGIbtywPc
	 +hpyzSEb9s7ccobvLQLJa08sK+xmiG8uXhb13wg+UBCcyie4wLMGe3zWCvim0cthGZCX1
	 ikO1UC53bzZEjj3v1gd0vpUnJbOHErEaPxJAFY5sDeMwOyQpPSWY1AyVGUwxYR0djI9d8
	 DLhFbAR6Jtk4tI96aq85qxAFi165l1ir0FnNg2H0dWB6pk8z16SuorQcKzKHVhdEmPGup
	 V/0u83qtyO2VvfSn3cjWGbTAZXhXZ5xdK5mbwpQpUCfoLz4uJ23ZH1cFCiPzj4+7tLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138F3606A31E;
	Fri, 27 Nov 2026 07:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=6RU1oFKuMH
	hPcoUnNRgnbZ8lM/IXfFQubzFnoTFvHE0=; b=owH5JISdvvG0SUXayBD8kcOzNr
	lqVgBU0zOWSuCCKOAQ5WcgKxSHm5PrAIjkCOd/ph1PdlGGgiXH56MNhJ8AadszdN
	lo+Nq69/jApb6trm1Soh3FM9rlPAigE6XVRCkIRMGIGHmywT3Z2j4rZw2Bq/nvE4
	OOOCh1U9/nO6i2IRE=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.43])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkDG6wEEMAlrz9pRAg--.37545S2;
	Fri, 27 Nov 2026 15:23:49 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [PATCH v4] net: ethtool: do not call get_regs() for zero-length dumps
Date: Fri, 27 Nov 2026 15:23:48 +0800
Message-Id: <20261127072348.5277-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:BrQMCkDG6wEEMAlrz9pRAg--.37545S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr45uryrtFyrJF17GFWUXFb_yoW5Xr4xpF
	Z5Way7JrWjqrykCw4UJa17try5A39xXFWxCry8tw15Zrn8Za18CFy8Ka9F9r13JrWv9Fy0
	vFWvyF95Cas8CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r
	4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8FPfDUUUUU=
	=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUKD2sIS1mViwAAsu

ethtool_get_regs() passes the user-supplied regs.len to the driver
unchanged, including zero.  A zero-length dump has nothing to fill in,
but the driver callback still runs and may use that length for its own
I/O.  A zero-length transfer cannot move any data, and some transports
report a warning for it, which becomes a denial of service when
panic_on_warn is set.

Return success without calling into the driver when the requested dump
length is zero.  The check comes after get_regs_len() so that drivers
which cannot provide a dump still return their error to userspace:
ethtool(8) sends a zero-length request when ETHTOOL_GDRVINFO reported
no regdump_len, which is what happens when get_regs_len() fails.

This does not remove a way to query the dump size: the uAPI tells users
to obtain it from ETHTOOL_GDRVINFO.regdump_len, and the core only clamps
an oversized regs.len down to get_regs_len().  Since a zero-length dump
returns no data, the driver also cannot fill in regs.version; callers
that need the version have to request the dump.

The problem was found while testing the ethtool register dump path of
an MCS7830 adapter.

Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
v4: drop Fixes: and the stable Cc; there is no report behind this
    (Andrew Lunn).  Move the zero-length check after the get_regs_len()
    result check so drivers which fail get_regs_len() keep reporting the
    error to ethtool -d, and document that a zero-length dump returns
    neither data nor the version.
v3: describe the ethtool behaviour instead of the USB stack, and document
    that ETHTOOL_GREGS has no zero-length size query (the size comes from
    ETHTOOL_GDRVINFO.regdump_len) (Andrew Lunn).
v2: handle this in the ethtool core instead of the mcs7830 driver.
    https://lore.kernel.org/r/20261126015239.6038-1-25031212351@stu.xidian.edu.cn/
v1: https://lore.kernel.org/r/20261125071649.7052-1-25031212351@stu.xidian.edu.cn/

 net/ethtool/ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 80b7930b3fe0..4839ef141b21 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -1783,6 +1783,10 @@ static int ethtool_get_regs(struct net_device *dev, char __user *useraddr)
 	if (reglen <= 0)
 		return reglen;
 
+	/* A zero-length dump has nothing to fill in. */
+	if (!regs.len)
+		return 0;
+
 	if (regs.len > reglen)
 		regs.len = reglen;
 
-- 
2.34.1

