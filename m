Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081603;
	b=AoX6DdB0cHvmCQJcrk5CHuSdQNXg7KTWjmZxwpRDXbiVxk/+9l587IW6NVkzqdStBZlE
	 2sP/t0i7QhBi2+/YO4qIgP37jaLS0CUD4/SfRRUBQOjCz+BjbSWgmkWdI9KUMMpPuogt/
	 kO8S/itJn2uvKdMoOYf0yyIoLG2JlQds9OiTRdDAdd2wKVFZkI7uEAFG1HjlZzMu5W70p
	 weV1BEGKTXjtUovRSXb6yqbVNgtV65lxZ1rWCbb0iv9yvYuzx4d9K8wxvsof/za+l/oHN
	 qKOouGJmKfmX58ePA/llZI/IAlhky6WJdIgYHnyvcI02p08Y9but5MGW1PnYm/tHlpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081603;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:To:Cc:
	 Message-ID:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=3BqdCJTGw47ZPbEBDmV2Sxr2xhOXRAA8TmzOR2G/4rE=;
	b=vl5Bc4QaGOPi29D9n4hxq0OP6+hVQqesMHIezKKVvTqAEZO7hgLNehbRToYsSrHxHIdO
	 KVDvsnQNVVHTJHvX5r3vK6LspLt2ByehAgfbsH1ONHzKb21efjpLmazZuRBGHXBLxzLRt
	 60iaidyfPYJcoHZS7IGXh3DolUTBCL/W4INAatn3IXtdaVofrgTGxpI/Nhe8o5Sct0qpj
	 zGKMQt10fpVMICt263elTqXuHm0xN2spHf8rszsRuWcB/YdNblCn7Z7NfvF9/tMvnn1U8
	 sKkrdNS46mUWGHFMsNd1KMicNoe1hQvrLoWx/r635jMFkQxfbvy0Z7CgnnBi3EyZqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=PECAIvbD;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8782606A333;
	Thu, 19 Nov 2026 09:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8782606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=PECAIvbD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:Date:Subject:To:Cc:
	Message-ID; bh=3BqdCJTGw47ZPbEBDmV2Sxr2xhOXRAA8TmzOR2G/4rE=; b=P
	ECAIvbDr/63E056kTp7RIxuk9w+EhN9D3nGamcaf234TdfvVY/yh1gbyt9Rrc0YB
	wzq9A6p1nf57do74aRMEdTwkCWsKm57PDh3aRkYuleEdLuauZelz6hhWMtR8CtuG
	nj3NAyNEIS5JSD8yw6+SHNKcokS7D3yiNZtH7Malps=
Received: from v3_final.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQAXhjZ2xf5q5qN6Ag--.9276S2;
	Thu, 19 Nov 2026 17:46:30 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Date: Thu, 19 Nov 2026 17:46:13 +0800
Subject: [PATCH net-next v3] net: sparx5: check DT port reg against chip port count
To: Daniel Machon <daniel.machon@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
X-CM-TRANSID:yAQGZQAXhjZ2xf5q5qN6Ag--.9276S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4fXFyxuFWUXw47Gr1rJFb_yoW5Cr4xpF
	Z8Aas8KrW8Gr43Ca4xJw48uas09a1DXFy5Wr1xCwsxWw45GFW0yryxKFs0vF1jkrWrJa97
	JF4Yqa43Ca9FkFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r
	17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42
	IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5qZX3UUUUU=
	=
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQEQD2r+rmUtngAAsz
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Message-ID: <20261119094613.klyjRQ7HPrCZV7VwnhNzSf_Ev6wIWbyixM5FfrNrJS8@z>

From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
portno, which sparx5_create_port() later uses to index the fixed-size
sparx5->ports[] array:

    sparx5->ports[config->portno] = spx5_port;

The value is never validated, so an out-of-range 'reg' (runtime overlay,
corrupted or attacker-controlled DTB, kexec-supplied or bootloader
fixed-up DT) turns probe into an out-of-bounds write.

Skip port nodes with an out-of-range 'reg'.  lan966x_probe_port() has
the same bounds check but fails probe with -EINVAL; skipping here keeps
the remaining valid ports working.  The bound is the per-chip port count
from the match data (sparx5->data->consts->n_ports), so lan969x, which
shares this probe path and has only 30 ports, is bounded correctly as
well.

Found by a scripted scan of of_property_read_u32() call sites used to
index fixed-size arrays, followed by manual review. Verified at runtime
on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
malicious DT overlay, the unmodified in-tree driver performs the store.
reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
with a later NULL oops. With this patch all three are skipped. The PoC
and full logs are posted in the thread. Not tested on real hardware,
QEMU virt (cortex-a57) and compile testing only.

Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
v2 -> v3:
- Fix the diff paths (a/a/ -> a/, b/b/ -> b/) so the patch applies
  (Daniel Machon).
- Restore the in-body From: line so the author matches the Signed-off-by
  (checkpatch author/Signed-off-by mismatch).
- Clarify that lan966x fails probe instead of skipping (Daniel Machon).

v1 -> v2:
- Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
  so that lan969x (30 ports), which goes through the same probe, is
  bounded correctly as well (Daniel Machon).
- Document how the issue was found, the runtime verification and the
  test setup, as requested by the patch bot.

 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 08a398adf..164706745 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 			dev_err(sparx5->dev, "port reg property error\n");
 			continue;
 		}
+		if (portno >= sparx5->data->consts->n_ports) {
+			dev_err(sparx5->dev, "port %u: reg out of range\n",
+				portno);
+			continue;
+		}
 		config = &configs[idx];
 		conf = &config->conf;
 		conf->speed = SPEED_UNKNOWN;

