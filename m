Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076115;
	b=sOmzKfcUj1VflbQatxB1Rug8OwpDs/GadtgZJQEwkv9P6ucg3XSRZpKOnmSqdveajqpE
	 OTDjoR+d5OuogDywr16N0sQwE5kdnklXIQfMWZYdYhQmi4kTEfeL9qXfhnqygYvP8Hi6I
	 bo1sFfRKeWFqlcTqEu9g7Uc/1OE6o6hE2zMhpPrWnmTSftvw2YVbWqj0jgKZ4LHDeUyO1
	 IKLTMSwR45Ys+ooLzH77UHdg9Lk6AvZj9OiSztZnWvgHb3J+leAR6wZL5+N/K/ERtj2Sr
	 5f7Xbagb69xNnazACkR9rl9/sLCUDTFod8wn/XzvkWt4jxFIkfvwRf4U1wUvyJYsvAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076115;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=LKhSUFZiKht3O3lHBosMHkQH7emcTORKH+eG3szv0nI=;
	b=jquT+NWnbjeN1rzMPe+cjjX5b9Emx7ybRnnbtPfhUu/+eqMDlu6nX9u6prXMjfp9CiVt
	 NseZPiVpM7CHN6j9m/E7yUp+31NB84hu7VegldekinT3GoJxwUT1QlskJYDO/7fgzI/0a
	 AMS9QbPeoyzfKlqTnZcIhqeVS1hIZ7bsicEQriJiP/4WjSpfQ4YjZUfPVPCbxGqUqvkBO
	 7ljC9dsNLxVNCoVsd+oNvwUk1n8NEesV5pXyoXxYQMkkkeaOW9TdfWGPWVyIXEoMNCvtw
	 pE8APMI6nh2LARG39KDf+fMrySJ7y/TQDghDARu8nq9Dq4lDAQZKipPhu2vu50tXTTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=GLhUWeCb;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A074960A6F44;
	Thu, 19 Nov 2026 08:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A074960A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=GLhUWeCb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LKhSUFZiKht3O3lHBosMHkQH7emcTORKH+eG3szv0nI=; b=GLhUWeCbeeKKI
	wUX/1UmdLmBhoBH5hKzR+yzAdJhnP6gvcXelbyTPd+AacvYthaU44Zfk8DuCbV+E
	FcUZlYZR8Q2MP3C+nd99VRc7PABbTy5kI1BPQEC+Q7qTEet2en81BfDGl3YrkN9c
	RfOjxoe89QVvnLxqiH1q8KoRYwtdx4=
Received: from 09.eml (unknown [58.206.202.11])
	by web3 (Coremail) with SMTP id ygQGZQBH+pEGsP5qG1LEAA--.62695S2;
	Thu, 19 Nov 2026 16:15:02 +0800 (CST)
From: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
To: justin.chen@broadcom.com, florian.fainelli@broadcom.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, wanghr2026@mail.zgclab.edu.cn
Subject: [PATCH] net: bcmasp: avoid refcount drain on probe
Date: Thu, 19 Nov 2026 16:15:02 +0800
Message-ID: <1795076102979-9-385853cc@mail.zgclab.edu.cn>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ygQGZQBH+pEGsP5qG1LEAA--.62695S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZry5tFyrtry5Cr47Zr43Wrg_yoW5WF1xpF
	43CFyS9rWkXr1xK397J3WkZayFqws5tF15GFn7Wan5Za1DAr1aqF1xK345Wr1DKrW8Gw1a
	qF4DZ3yaya4DJ3DanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1ln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5Mc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0
	x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	WUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeyCJDUUUU
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgIQD2r+rloDYAAGsa

bcmasp_probe() calls of_find_node_by_name(dev->of_node, "ethernet-ports"),
which unconditionally drops the from-node reference the caller never held.
Every probe or bind cycle that reaches the port scan, including ones that
later fail with "No ports found", drains the asp node refcount by one. Once
it hits zero, of_node_release() deadlocks in its error printk (%pOF on the
parent while holding devtree_lock with IRQs off), so the machine freezes
silently with nothing on the console.

Use of_get_child_by_name() which leaves the parent reference alone.

Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
---

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index a59a006cea3a..af9e14214987 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -1342,7 +1342,7 @@ static int bcmasp_probe(struct platform_device *pdev)
 
 	bcmasp_init_wol(priv);
 
-	ports_node = of_find_node_by_name(dev->of_node, "ethernet-ports");
+	ports_node = of_get_child_by_name(dev->of_node, "ethernet-ports");
 	if (!ports_node) {
 		dev_warn(dev, "No ports found\n");
 		ret = -EINVAL;

---

PoC reproduction (7.4.0-rc2, arm64 QEMU virt, unmodified kernel):

Device tree injection, spliced into the QEMU virt machine DT:

    reserved-memory { #address-cells = <2>; #size-cells = <2>; ranges;
        asp-regs@7f000000 { no-map; reg = <0x0 0x7f000000 0x0 0x200000>; }; };

    asp@7f000000 { compatible = "brcm,asp-v2.2"; reg = <0x0 0x7f000000 0x0 0x200000>;
        interrupt-parent = <&gpio0>; interrupts = <4 2>; };

The node has no ethernet-ports child, so every probe passes through the
of_find_node_by_name() call and then fails with "No ports found".

Trigger (repeated bind cycles):

    modprobe bcm-asp
    echo "7f000000.asp" > /sys/bus/platform/drivers/brcm,asp-v2/bind
    echo "7f000000.asp" > /sys/bus/platform/drivers/brcm,asp-v2/bind

Result:

    brcm,asp-v2 7f000000.asp: Failed to init WoL irq: -6
    brcm,asp-v2 7f000000.asp: No ports found
    MARK: probe1 done
    MARK: bind -> probe2
    MARK: bind -> probe3
    (no further output)

The third probe drives the asp node refcount to zero and the machine
freezes inside of_node_release().

Control: with the same DT minus the interrupt properties the probe fails
before this call and three or more bind cycles run clean.

Note: the PoC was generated with AI assistance and the vulnerability was
found by static analysis. The device tree is trusted input (a bad DT
requires root or physical access), so this is not a security fix, but it
prevents a potential resource leak or system failure on a failed probe or
an old or malformed DT.

